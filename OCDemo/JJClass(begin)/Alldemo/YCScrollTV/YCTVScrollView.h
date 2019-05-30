//
//  YCTVScrollView.h
//  OCDemo
//
//  Created by yangchang on 2019/5/29.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCTVScrollView : UIView

//分几页
@property (nonatomic,assign) NSInteger pageNum;

//顶部视图
@property (nonatomic,strong) UIView *headView;

//切换视图
@property (nonatomic,strong) UIView *selectTapView;

//缩进距离


- (void)setUI;

@end

NS_ASSUME_NONNULL_END
