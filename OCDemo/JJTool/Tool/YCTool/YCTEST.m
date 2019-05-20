//
//  YCTEST.m
//  OCDemo
//
//  Created by yangchang on 2019/5/18.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCTEST.h"

@interface YCTEST ()

@end

@implementation YCTEST

//
//#pragma mark - 表格的使用
//- (void)initTableView{
//    
//    NSMutableArray *tables = [@[] mutableCopy];
//    SNJJWEAK
//    //表格视图
//    JJBaseTableView *jjTableView = [JJBaseTableView tableView:self.view.bounds style:UITableViewStylePlain registerDic:@{@"cell":@[@{@"class":@"JJTableViewCell"}],@"group":@[@{@"class":@"UITableViewHeaderFooterView"}]} headRefresh:^(JJBaseTableView *jjView,UITableView * _Nonnull tableView, NSMutableArray * _Nonnull datas) {
//        
//        [YCHttpTool getHttpNormal:@"https://raw.githubusercontent.com/the-best-looking-is-me/Data/master/t.txt" dic:nil block:^(id sth, id sth2) {
//            [datas removeAllObjects];
//            if ([sth haveValue] && sth[@"data"]) {
//                NSArray *array = sth[@"data"];
//                for (NSInteger i=0; i<array.count; i++) {
//                    JJTModel *model = [JJTModel mj_objectWithKeyValues:array[i]];
//                    [datas addObject:model];
//                }
//            }
//            [tableView.mj_header endRefreshing];
//            [jjView reloadData];
//            if (datas.count > 0) {
//                tableView.mj_footer.hidden = NO;
//            }
//        }];
//    } footRefresh:^(JJBaseTableView *jjView,UITableView * _Nonnull tableView, NSMutableArray * _Nonnull datas) {
//        
//        [YCHttpTool getHttpNormal:@"https://raw.githubusercontent.com/the-best-looking-is-me/Data/master/t.txt" dic:nil block:^(id sth, id sth2) {
//            if ([sth haveValue] && sth[@"data"]) {
//                NSArray *array = sth[@"data"];
//                for (NSInteger i=0; i<array.count; i++) {
//                    JJTModel *model = [JJTModel mj_objectWithKeyValues:array[i]];
//                    [datas addObject:model];
//                }
//                [jjView moreData:array.count];
//            }
//            [tableView.mj_footer endRefreshing];
//            [jjView reloadData];
//        }];
//    } sectionNum:^NSInteger(UITableView * _Nonnull tableView) {
//        return 1;
//    } rowsNum:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
//        return tables.count;
//    } rowsHeight:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        return 100;
//    } cellForRow:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        
//        Class class = JJTableViewCell.class;
//        JJTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
//        if (!cell) {
//            cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(class)];
//        }
//        [cell refreshUI:tables[indexPath.row]];
//        return cell;
//        
//    } didSelect:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        
//        JJIndexPageVC *vc = [JJIndexPageVC new];
//        [weak.navigationController pushViewController:vc animated:YES];
//    }];
//    
//    [jjTableView tableViewGroupHeadHeight:^CGFloat(UITableView * _Nonnull tableView, NSInteger section) {
//        return 40;
//    } headerView:^UIView * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
//        UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
//        if (header == nil) {
//            header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"UITableViewHeaderFooterView"];
//        }
//        header.contentView.backgroundColor = [UIColor redColor];
//        return header;
//    } GroupFooterHeight:nil footerView:nil];
//    
//    [self.view addSubview:jjTableView];
//    //数组绑定
//    jjTableView.datas = tables;
//    
//    //空白页
//    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    emptyView.center = jjTableView.center;
//    emptyView.backgroundColor = [UIColor redColor];
//    [jjTableView emptyView:emptyView];
//    
//    //[jjTableView.tableView.mj_header beginRefreshing];
//}


@end
