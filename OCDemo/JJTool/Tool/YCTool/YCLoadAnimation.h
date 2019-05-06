//
//  YCLoadAnimation.h
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface YCLoadAnimation : NSObject

@property (nonatomic,strong)MBProgressHUD *hud;

/**
 加载提示框
 
 @param view 父视图
 @param text 内容文字
 @param time 持续时间
 @param center 位置
 */
+ (YCLoadAnimation *)loadAtView:(UIView *)view label:(NSString *)text lastTime:(CGFloat)time center:(CGPoint)center;

/**
 文字提示框，带副标题
 
 @param view 父视图
 @param text 主标题
 @param subTitle 副标题
 @param time 持续时间
 @param center 位置
 */
+ (YCLoadAnimation *)loadAtView:(UIView *)view label:(NSString *)text subTitle:(NSString *)subTitle lastTime:(CGFloat)time center:(CGPoint)center;

+ (YCLoadAnimation *)loadImgAtView:(UIView *)view img:(NSString *)img label:(NSString *)text;

/**
 带菊花圈和可选文字的提示
 
 @param view 父视图
 @param text 提示文字
 @return 菊花对象
 */
+ (YCLoadAnimation *)loadCircleAtView:(UIView *)view label:(NSString *)text;

/**
 隐藏 带菊花圈和可选文字的提示 的对象
 
 @param time 什么时间隐藏
 */
- (void)hideAtTime:(CGFloat )time;


/**
 系统菊花
 
 @param indicatorStyle 样式
 @param view 父视图
 @param rect 尺寸大小
 @param indicatorColor 菊花颜色
 @param backColor 背景颜色
 @param hidesWhenStopped 停止时是否隐藏
 @return 对象
 */
+ (UIActivityIndicatorView *)loadIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle atView:(UIView *)view frame:(CGRect)rect color:(UIColor *)indicatorColor backColor:(UIColor *)backColor hidesWhenStopped:(BOOL)hidesWhenStopped;

@end











