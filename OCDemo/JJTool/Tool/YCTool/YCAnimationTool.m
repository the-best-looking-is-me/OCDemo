//
//  YCAnimationTool.m
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import "YCAnimationTool.h"

@implementation YCAnimationTool


/**
 基于Canvas动画

 @param sth 需要动画的对象
 @param type 动画类型
 @param time 动画时长
 @param delayTime 延迟执行
 */
+ (void)animationCanvasSth:(id)sth animationType:(CSAnimationType)type lastTime:(CGFloat)time delayTime:(CGFloat)delayTime{
    
    Class <CSAnimation> class = [CSAnimation classForAnimationType:type];
    [class performAnimationOnView:sth duration:time delay:delayTime];
}

@end
