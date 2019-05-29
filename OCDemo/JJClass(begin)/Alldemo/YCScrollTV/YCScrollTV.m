//
//  YCScrollTV.m
//  OCDemo
//
//  Created by yangchang on 2019/5/28.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCScrollTV.h"

@interface YCScrollTV ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *mainScrollView;

@end

@implementation YCScrollTV

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"滑动demo";
    
    [self createUI:3];
    [self naviViewToFont];
}

- (void)createUI:(NSInteger)num{
    _mainScrollView = [YCUI ui_scrollView:self.view.bounds];
    [_mainScrollView setContentSize:CGSizeMake(_mainScrollView.Width * num, 0)];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.delegate = self;
    _mainScrollView.backgroundColor = KKTestColor;
    [self.view addSubview:_mainScrollView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / scrollView.Width;
    NSLog(@"第几页 =%zd",page);
}



@end
