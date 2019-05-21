//
//  JJIndexPageVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJIndexPageVC.h"
#import "JJTableViewCell.h"
#import "JJTModel.h"

@interface JJIndexPageVC ()

@end

@implementation JJIndexPageVC

- (void)viewDidLoad{
    [super viewDidLoad];
 
    [self initNavi];
    [self initTableView];
    [self naviViewToFont];
}

#pragma mark - 导航栏设置
- (void)initNavi{
    self.title = @"示例";

    //右侧按扭
    UIButton *rightBtn = [YCUI ui_buttonSimple:CGRectMake(0, 0, 44, 44) font:[UIFont systemFontOfSize:16] normalColor:[UIColor blackColor] normalText:@"点我" click:^(id  _Nonnull x) {
        NSLog(@"点我");
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

#pragma mark - 表格的使用
- (void)initTableView{
    
    NSMutableArray *tables = [@[] mutableCopy];
    SNJJWEAK
    //表格视图
    JJBaseTableView *jjTableView = [JJBaseTableView tableView:CGRectMake(0, 0, ScreenWidth,ScreenHeight - self.tabBarController.tabBar.Height) style:UITableViewStylePlain registerDic:@{@"cell":@[@{@"class":@"JJTableViewCell"}],@"group":@[@{@"class":@"UITableViewHeaderFooterView"}]} headRefresh:^(JJBaseTableView *jjView,UITableView * _Nonnull tableView, NSMutableArray * _Nonnull datas) {
        
        //网络请求可封闭
        [YCHttpTool getHttpNormal:@"https://raw.githubusercontent.com/the-best-looking-is-me/Data/master/t.txt" dic:nil block:^(id sth, id sth2) {
            [datas removeAllObjects];
            if ([sth haveValue] && sth[@"data"]) {
                NSArray *array = sth[@"data"];
                for (NSInteger i=0; i<array.count; i++) {
                    
                    //NSLog(@"=== %@",[YCAnalysis objectCreateProperty:array[i] DicUseID:NO]);
                    JJTModel *model = [JJTModel mj_objectWithKeyValues:array[i]];
                    [datas addObject:model];
                }
            }
            [tableView.mj_header endRefreshing];
            [jjView reloadData];
            if (datas.count > 0) {
                tableView.mj_footer.hidden = NO;
            }
        }];
    } footRefresh:nil sectionNum:^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    } rowsNum:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return tables.count;
    } rowsHeight:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 100;
    } cellForRow:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        
        Class class = JJTableViewCell.class;
        JJTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
        if (!cell) {
            cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(class)];
        }
        [cell refreshUI:tables[indexPath.row]];
        return cell;
        
    } didSelect:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        Class class = NSClassFromString(((JJTModel *)tables[indexPath.row]).vc);
        id sth = [class new];
        [weak.navigationController pushViewController:sth animated:YES];
    }];
    
    [jjTableView tableViewDidScroll:^(UIScrollView * _Nonnull scrollView) {
        CGFloat y = scrollView.contentOffset.y;
        CGFloat per = y / (2 * SafeAreaTopHeight);
        weak.naviView.alpha = per;
    }];
    
    //表头
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    headerView.backgroundColor = [UIColor redColor];
    jjTableView.tableView.tableHeaderView = headerView;
    [self.view addSubview:jjTableView];
    
    //数组绑定
    jjTableView.datas = tables;
    
    //空白页
    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    emptyView.center = jjTableView.center;
    emptyView.backgroundColor = [UIColor redColor];
    [jjTableView emptyView:emptyView];
    
    [jjTableView.tableView.mj_header beginRefreshing];
}


- (void)dealloc{
    NSLog(@"dealloc");
}


@end
