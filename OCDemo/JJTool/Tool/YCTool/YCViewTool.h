//
//  YCViewTool.h
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCViewTool : NSObject


/**
 给layer设置渐变颜色
 
 @param rect layer尺寸
 @param layer layer
 @param startPoint 开始点 0〜1
 @param endPoint 结束点 0〜1
 @param array 颜色数组
 @param locations 渐变数组 0〜1
 */
+ (void)ui_gradientRect:(CGRect)rect layer:(CALayer *)layer startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint colorArray:(NSArray<UIColor *> *)array locations:(NSArray <NSNumber *>*)locations;
/**
 view转成image
 
 @param view view
 @param transparent 是否透明
 @return image
 */
+ (UIImage *)ui_ViewToImageView:(UIView*)view transparent:(BOOL)transparent;

@end

NS_ASSUME_NONNULL_END
