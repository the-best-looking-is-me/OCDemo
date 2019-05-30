//
//  YCTVTableView.m
//  OCDemo
//
//  Created by yangchang on 2019/5/29.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCTVTableView.h"
#import "YCTVTableCell.h"

@interface YCTVTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation YCTVTableView

- (void)setUI{
    SNJJWEAK
    _tableView = [YCUI ui_tableView:self.bounds style:UITableViewStylePlain backColor:[UIColor whiteColor] delegate:self registerDic:@{@"cell":@[@{@"class":@"YCTVTableCell"}]}];
    [self addSubview:_tableView];
    
    //缩进
    _tableView.contentInset = UIEdgeInsetsMake(_insety, 0, 0, 0);
    
    //刷新
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [YCThreadSimple threadAt:YCThreadMain DelayTime:3 operate:^{
            [weak.tableView.mj_header endRefreshing];
        }];
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [YCThreadSimple threadAt:YCThreadMain DelayTime:1 operate:^{
            [weak.tableView.mj_footer endRefreshing];
        }];
    }];
    
 
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.tableViewScroll) {
        self.tableViewScroll(self,scrollView.contentOffset.y);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"1");
    if (self.tableViewHaveSub) {
        self.tableViewHaveSub(self,scrollView.contentOffset.y,YES);
    }
}

- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView{
    if (self.tableViewHaveSub) {
        self.tableViewHaveSub(self,scrollView.contentOffset.y,NO);
    }
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class = YCTVTableCell.class;
    YCTVTableCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
    if (!cell) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(class)];
    }
    [cell refreshUI:[NSString stringWithFormat:@"这是第%zd页 - %zd",self.page,indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
