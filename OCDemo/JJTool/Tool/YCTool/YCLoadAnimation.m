//
//  YCLoadAnimation.m
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import "YCLoadAnimation.h"

@implementation YCLoadAnimation


/**
 文字提示框

 @param view 父视图
 @param text 内容文字
 @param time 持续时间
 @param center 位置
 */
+ (YCLoadAnimation *)loadAtView:(UIView *)view label:(NSString *)text lastTime:(CGFloat)time center:(CGPoint)center{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    
    YCLoadAnimation *yc = [[YCLoadAnimation alloc]init];
    yc.hud = hud;
    
    if (center.x <= 0.1 && center.y <= 0.1) {
        hud.center = CGPointMake(view.bounds.size.width * 0.5, view.bounds.size.height * 0.5);
    }else {
        hud.center = center;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hide:YES afterDelay:time];
    });
    
    return yc;
}


/**
 文字提示框，带副标题

 @param view 父视图
 @param text 主标题
 @param subTitle 副标题
 @param time 持续时间
 @param center 位置
 */
+ (YCLoadAnimation *)loadAtView:(UIView *)view label:(NSString *)text subTitle:(NSString *)subTitle lastTime:(CGFloat)time center:(CGPoint)center{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    
    YCLoadAnimation *yc = [[YCLoadAnimation alloc]init];
    yc.hud = hud;
    
    hud.labelText = text;
    
    hud.detailsLabelText = subTitle;
    
    if (center.x <= 0.1 && center.y <= 0.1) {
        hud.center = CGPointMake(view.bounds.size.width * 0.5, view.bounds.size.height * 0.5);
    }else {
        hud.center = center;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hide:YES afterDelay:time];
    });

    return yc;
}

+ (YCLoadAnimation *)loadImgAtView:(UIView *)view img:(NSString *)img label:(NSString *)text{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]];
    hud.labelText = text;
    YCLoadAnimation *yc = [[YCLoadAnimation alloc]init];
    yc.hud = hud;
    return yc;
}

/**
 带菊花圈和可选文字的提示

 @param view 父视图
 @param text 提示文字
 @return 菊花对象
 */
+ (YCLoadAnimation *)loadCircleAtView:(UIView *)view label:(NSString *)text{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    YCLoadAnimation *yc = [[YCLoadAnimation alloc]init];
    yc.hud = hud;
    return yc;
    
}


/**
 隐藏 带菊花圈和可选文字的提示 的对象

 @param time 什么时间隐藏
 */
- (void)hideAtTime:(CGFloat )time{
    if (_hud) {
        [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
        [_hud hide:YES afterDelay:time];
    }
}



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
+ (UIActivityIndicatorView *)loadIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle atView:(UIView *)view frame:(CGRect)rect color:(UIColor *)indicatorColor backColor:(UIColor *)backColor hidesWhenStopped:(BOOL)hidesWhenStopped{
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(indicatorStyle)];
    //设置小菊花的frame
    activityIndicator.frame= rect;
    //设置小菊花颜色
    activityIndicator.color = indicatorColor;
    //设置背景颜色
    activityIndicator.backgroundColor = backColor;
    //刚进入这个界面会显示控件，并且停止旋转也会显示，只是没有在转动而已，没有设置或者设置为YES的时候，刚进入页面不会显示
    activityIndicator.hidesWhenStopped = hidesWhenStopped;
    
    return activityIndicator;
}

@end










