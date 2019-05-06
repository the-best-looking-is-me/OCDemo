//
//  YCAnimationTool.h
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CSAnimation.h>

@interface YCAnimationTool : NSObject

/**
 基于Canvas动画
 */
+ (void)animationCanvasSth:(id)sth animationType:(CSAnimationType)type lastTime:(CGFloat)time delayTime:(CGFloat)delayTime;


@end
