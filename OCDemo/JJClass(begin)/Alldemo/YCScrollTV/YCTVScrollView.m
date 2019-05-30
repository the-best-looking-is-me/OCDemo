//
//  YCTVScrollView.m
//  OCDemo
//
//  Created by yangchang on 2019/5/29.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCTVScrollView.h"
#import "YCTVTableView.h"

typedef enum : NSUInteger {
    KSelectTypeNone = 0,
    KSelectTypeTop,
    KSelectTypeFollow,
    KSelectTypeBottom,
} KSelectType;


@interface YCTVScrollView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,assign) KSelectType selectType;

@property (nonatomic,strong) NSMutableDictionary *page_dic;
@property (nonatomic,strong) YCTVTableView *currentTableView;

@property (nonatomic,strong) NSMutableArray *tableView_array;

@end

@implementation YCTVScrollView

- (void)setUI{
    
    _tableView_array = [NSMutableArray array];
    _page_dic = [NSMutableDictionary dictionary];
    [self createScrollView:_pageNum];
    _contentView = [self createHeadAndSelectTap];
    CGFloat maxy = _contentView.Height;
    //创建第0页
    for (NSInteger i=_pageNum - 1; i>=0; i--) {
        [self createTableView:i insety:maxy];
    }
}

//创建最底层的滑动视图
- (void)createScrollView:(NSInteger)num{
    _mainScrollView = [YCUI ui_scrollView:self.bounds];
    [_mainScrollView setContentSize:CGSizeMake(_mainScrollView.Width * num, 0)];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.delegate = self;
    _mainScrollView.backgroundColor = KKTestColor;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.bounces = NO;
    [self addSubview:_mainScrollView];
}

//头视图 和 选择视图
- (UIView *)createHeadAndSelectTap{
    
    UIView *contentView = [[UIView alloc] init];
   
    //添加头
    CGRect frame = _headView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    _headView.frame = frame;
    [contentView addSubview:_headView];
    
    //添加选择标签
    frame = _selectTapView.frame;
    frame.origin.x = 0;
    frame.origin.y = _headView.Height;
    _selectTapView.frame = frame;
    [contentView addSubview:_selectTapView];
    
    contentView.frame = CGRectMake(0,  - _selectTapView.maxY, ScreenWidth, _selectTapView.maxY);
    
    return contentView;
}

//创建上层的滑动视图
- (void)createTableView:(NSInteger)atPage insety:(CGFloat)y{
    
    if ([self havePage:atPage] != -1) {
        //有
        NSDictionary *dic = _page_dic[[NSString stringWithFormat:@"%zd",atPage]];
        _currentTableView = dic[@"view"];
        
        return;
    }
    
    NSLog(@"创建一个新的");
    
    SNJJWEAK
    YCTVTableView *tableView = [[YCTVTableView alloc] initWithFrame:CGRectMake(_mainScrollView.Width * atPage, 0, _mainScrollView.Width, _mainScrollView.Height)];
    tableView.page = atPage;
    _currentTableView = tableView;
    [_tableView_array addObject:tableView];
    tableView.insety = y;
    tableView.tableViewScroll = ^(YCTVTableView *tbView,CGFloat y) {
        
        if (weak.currentTableView != tbView) {
            return ;
        }
        
        CGFloat dis = -(y + tbView.insety);
        if (dis < - weak.headView.Height) {
            NSLog(@"顶住");
            weak.selectType = KSelectTypeTop;
            if (weak.contentView.superview != weak.mainScrollView) {
                [weak.contentView removeFromSuperview];
                [weak.mainScrollView addSubview:weak.contentView];
            }

            CGRect frame = weak.contentView.frame;
            frame.origin.y = - weak.headView.Height;
            frame.origin.x = tbView.origin.x;
            weak.contentView.frame = frame;
        }else if (dis > - weak.headView.Height && dis < 0) {
            
            //同步其他滚动
            NSArray *keys = [weak.page_dic allKeys];
            for (NSInteger i=0; i<keys.count; i++) {
                if (i != tbView.page) {
                    NSDictionary *tmp_dic = weak.page_dic[[NSString stringWithFormat:@"%zd",i]];
                    YCTVTableView *tmpView = tmp_dic[@"view"];
                    [tmpView.tableView setContentOffset:CGPointMake(0, tbView.tableView.contentOffset.y)];
                }
            }
            
            NSLog(@"跟随");
            weak.selectType = KSelectTypeFollow;
            NSLog(@"%@",tbView.tableView);
            if (weak.contentView.superview != tbView.tableView) {
                [weak.contentView removeFromSuperview];
                [tbView.tableView addSubview:weak.contentView];
            }

            CGRect frame = weak.contentView.frame;
            frame.origin.y = - weak.contentView.Height;
            frame.origin.x = 0;
            weak.contentView.frame = frame;
        }else if (dis > 0) {
            NSLog(@"下拉刷新");
            weak.selectType = KSelectTypeBottom;
            if (weak.contentView.superview != weak.mainScrollView) {
                [weak.contentView removeFromSuperview];
                [weak.mainScrollView addSubview:weak.contentView];
            }

            CGRect frame = weak.contentView.frame;
            frame.origin.y = 0;
            frame.origin.x = tbView.origin.x;
            weak.contentView.frame = frame;
        }else if (dis == 0){


        }else {
           //NSLog(@"other");
        }
    };

    tableView.tableViewHaveSub = ^(YCTVTableView * _Nonnull tbView, CGFloat y,BOOL rightNow) {

        if (weak.currentTableView != tbView) {
            return ;
        }
        
        if (rightNow) {
            CGFloat dis = -(y + tbView.insety);
            if (dis == 0) {
                if (weak.contentView.superview != tbView.tableView) {
                    [weak.contentView removeFromSuperview];
                    [tbView.tableView addSubview:weak.contentView];
                }

                CGRect frame = weak.contentView.frame;
                frame.origin.y = - weak.contentView.Height;
                frame.origin.x = 0;
                weak.contentView.frame = frame;
            }
        }else {

            [YCThreadSimple threadAt:YCThreadMain DelayTime:0.35 operate:^{
                CGFloat dis = -(y + tbView.insety);
                if (dis == 0) {
                    if (weak.contentView.superview != tbView.tableView) {
                        [weak.contentView removeFromSuperview];
                        [tbView.tableView addSubview:weak.contentView];
                    }

                    CGRect frame = weak.contentView.frame;
                    frame.origin.y = - weak.contentView.Height;
                    frame.origin.x = 0;
                    weak.contentView.frame = frame;
                }
            }];
        }

    };
    
    [_mainScrollView addSubview:tableView];
    [tableView setUI];
    [tableView.tableView addSubview:weak.contentView];
    
    NSDictionary *dic = @{@"page":[NSString stringWithFormat:@"%zd",atPage],
                          @"view":tableView
                          };
    [_page_dic setObject:dic forKey:[NSString stringWithFormat:@"%zd",atPage]];
    
    [_mainScrollView bringSubviewToFront:_headView];
    [_mainScrollView bringSubviewToFront:_selectTapView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    
    [self.contentView removeFromSuperview];
    CGRect frame = self.contentView.frame;
    if (self.selectType != KSelectTypeTop) {    
        frame.origin.y = - (self.currentTableView.tableView.contentOffset.y + self.contentView.Height);
    }
    frame.origin.x = x;
    self.contentView.frame = frame;
    [self.mainScrollView addSubview:self.contentView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / scrollView.Width;
    NSLog(@"第几页 =%zd",page);
    
    CGFloat maxy = _contentView.Height;
    [self createTableView:page insety:maxy];
}

//是否返回有指定页，有返回指定页数，没有返回-1
- (NSInteger)havePage:(NSInteger)num{
    NSArray *keys = [_page_dic allKeys];
    if ([keys containsObject:[NSString stringWithFormat:@"%zd",num]]) {
        return num;
    }
    return -1;
}


@end
