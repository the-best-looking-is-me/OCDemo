//
//  YCTVTableView.h
//  OCDemo
//
//  Created by yangchang on 2019/5/29.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCTVTableView : UIView

@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,assign) CGFloat insety;
@property (nonatomic,copy) void(^tableViewScroll)(YCTVTableView *tView,CGFloat y);
@property (nonatomic,copy) void(^tableViewHaveSub)(YCTVTableView *tView,CGFloat y,BOOL rightNow);

- (void)setUI;

@end

NS_ASSUME_NONNULL_END
