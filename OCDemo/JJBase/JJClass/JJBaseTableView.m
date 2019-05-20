//
//  JJBaseTableView.m
//  OCDemo
//
//  Created by yangchang on 2019/5/18.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJBaseTableView.h"

@interface JJBaseTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIView *emptyView;

@property (nonatomic,copy) NSInteger(^sectionNum)(UITableView *tableView);
@property (nonatomic,copy) NSInteger(^rowsNum)(UITableView *tableView,NSInteger section);
@property (nonatomic,copy) CGFloat(^rowsHeight)(UITableView *tableView,NSIndexPath *indexPath);
@property (nonatomic,copy) UITableViewCell *(^cellForRow)(UITableView *tableView,NSIndexPath *indexPath);
@property (nonatomic,copy) void (^didSelect)(UITableView *tableView,NSIndexPath *indexPath);

@property (nonatomic,copy) CGFloat(^headerHeight)(UITableView *tableView,NSInteger section);
@property (nonatomic,copy) UIView *(^headerView)(UITableView *tableView,NSInteger section);
@property (nonatomic,copy) CGFloat(^footerHeight)(UITableView *tableView,NSInteger section);
@property (nonatomic,copy) UIView *(^footerView)(UITableView *tableView,NSInteger section);

@property (nonatomic,copy) void(^didScroll)(UIScrollView *scrollView);

@end

@implementation JJBaseTableView

+ (JJBaseTableView *)tableView:(CGRect)rect
                         style:(UITableViewStyle)style
                   registerDic:(NSDictionary *)registerDic
                   headRefresh:(void(^)(JJBaseTableView *jjView,UITableView *tableView,NSMutableArray *datas))headRefresh
                   footRefresh:(void(^)(JJBaseTableView *jjView,UITableView *tableView,NSMutableArray *datas))footRefresh
                    sectionNum:(NSInteger(^)(UITableView *tableView))sectionNum
                       rowsNum:(NSInteger(^)(UITableView *tableView,NSInteger section))rowsNum
                    rowsHeight:(CGFloat(^)(UITableView *tableView,NSIndexPath * indexPath))rowsHeight
                    cellForRow:(UITableViewCell *(^)(UITableView *tableView,NSIndexPath *indexPath))cellForRow
                     didSelect:(void(^)(UITableView *tableView,NSIndexPath *indexPath))didSelect
{
    
    //回调
    JJBaseTableView *view = [[JJBaseTableView alloc] initWithFrame:rect];
    view.datas = [NSMutableArray array];
    view.sectionNum = sectionNum;
    view.rowsNum = rowsNum;
    view.rowsHeight = rowsHeight;
    view.cellForRow = cellForRow;
    view.didSelect = didSelect;
    
    view.tableView = [YCUI ui_tableView:view.bounds style:style backColor:[UIColor whiteColor] delegate:view registerDic:registerDic];
    view.tableView.separatorStyle = 0;
    [view addSubview:view.tableView];
    
    //头刷新
    if (headRefresh) {
        view.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            view.emptyView.hidden = YES;
            if (view.tableView.mj_footer.refreshing) {
                [view.tableView.mj_footer endRefreshing];
            }
            view.tableView.mj_footer.hidden = YES;
            
            headRefresh(view,view.tableView,view.datas);
        }];
    }
    //尾刷新
    if (footRefresh) {
        view.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            if (view.tableView.mj_header.refreshing) {
                [view.tableView.mj_header endRefreshing];
            }
            
            footRefresh(view,view.tableView,view.datas);
        }];
    }
    view.tableView.mj_footer.hidden = YES;
    
    return view;
}

- (void)tableViewGroupHeadHeight:(CGFloat(^)(UITableView *tableView,NSInteger section))headerHeight
                      headerView:(UIView *(^)(UITableView *tableView,NSInteger section))headerView
                 GroupFooterHeight:(CGFloat(^)(UITableView *tableView,NSInteger section))footerHeight
                      footerView:(UIView *(^)(UITableView *tableView,NSInteger section))footerView

{
    _headerHeight = headerHeight;
    _headerView= headerView;
    _footerHeight = footerHeight;
    _footerView = footerView;
    
}

//设置没有数据时的显示样式
- (void)emptyView:(UIView *)emptyView{
    _emptyView = emptyView;
    _emptyView.hidden = YES;
    [self.tableView addSubview:_emptyView];
}

//刷新数据
- (void)reloadData{
    self.emptyView.hidden = self.datas.count;
    [self.tableView reloadData];
}

//上拉加载是否还有数据
- (void)moreData:(BOOL)moreData{
    if (moreData) {
        [self.tableView.mj_footer resetNoMoreData];
    }else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_didScroll) {
        _didScroll(scrollView);
    }
}

- (void)tableViewDidScroll:(void(^)(UIScrollView *scrollView))didScroll{
    _didScroll = didScroll;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.sectionNum) {
        return self.sectionNum(tableView);
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.rowsNum) {
        return self.rowsNum(tableView,section);
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rowsHeight) {
        return self.rowsHeight(tableView,indexPath);
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellForRow) {
        return self.cellForRow(tableView,indexPath);
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelect) {
        self.didSelect(tableView, indexPath);
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.headerHeight) {
        return self.headerHeight(tableView,section);
    }
    return 0.1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.headerView) {
        return self.headerView(tableView,section);
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.footerHeight) {
        return self.footerHeight(tableView,section);
    }
    return 0.1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.footerView) {
        return self.footerView(tableView,section);
    }
    return nil;
}



@end
