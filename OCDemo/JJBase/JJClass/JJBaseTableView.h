//
//  JJBaseTableView.h
//  OCDemo
//
//  Created by yangchang on 2019/5/18.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJBaseTableView : UIView

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *datas;

//1.创建表格
+ (JJBaseTableView *)tableView:(CGRect)rect
                         style:(UITableViewStyle)style
                   registerDic:(NSDictionary *)registerDic
                   headRefresh:(void(^)(JJBaseTableView *jjView,UITableView *tableView,NSMutableArray *datas))headRefresh
                   footRefresh:(void(^)(JJBaseTableView *jjView,UITableView *tableView,NSMutableArray *datas))footRefresh
                    sectionNum:(NSInteger(^)(UITableView *tableView))sectionNum
                       rowsNum:(NSInteger(^)(UITableView *tableView,NSInteger section))rowsNum
                    rowsHeight:(CGFloat(^)(UITableView *tableView,NSIndexPath * indexPath))rowsHeight
                    cellForRow:(UITableViewCell *(^)(UITableView *tableView,NSIndexPath *indexPath))cellForRow
                     didSelect:(void(^)(UITableView *tableView,NSIndexPath *indexPath))didSelect;

//2.组头组尾
- (void)tableViewGroupHeadHeight:(CGFloat(^)(UITableView *tableView,NSInteger section))headerHeight
                      headerView:(UIView *(^)(UITableView *tableView,NSInteger section))headerView
               GroupFooterHeight:(CGFloat(^)(UITableView *tableView,NSInteger section))footerHeight
                      footerView:(UIView *(^)(UITableView *tableView,NSInteger section))footerView;



//3.刷新数据
- (void)reloadData;

//4.设置没有数据时的显示样式
- (void)emptyView:(UIView *)emptyView;

//5.上拉加载是否还有数据
- (void)moreData:(BOOL)moreData;

// 滚动回调
- (void)tableViewDidScroll:(void(^)(UIScrollView *scrollView))didScroll;

@end

NS_ASSUME_NONNULL_END
