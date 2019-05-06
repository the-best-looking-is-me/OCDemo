//
//  YCViewTool.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCViewTool.h"

@implementation YCViewTool


/**
 给layer设置渐变颜色

 @param rect layer尺寸
 @param layer layer
 @param startPoint 开始点 0〜1
 @param endPoint 结束点 0〜1
 @param array 颜色数组
 @param locations 渐变数组 0〜1
 */
+ (void)ui_gradientRect:(CGRect)rect layer:(CALayer *)layer startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint colorArray:(NSArray<UIColor *> *)array locations:(NSArray <NSNumber *>*)locations{
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = rect;
    
    NSMutableArray *cgArray = [NSMutableArray array];
    for (UIColor *c in array) {
        [cgArray addObject:(__bridge id)c.CGColor];
    }
    
    if (cgArray) gradient.colors = cgArray;
    if (locations) gradient.locations = locations;
    gradient.startPoint = startPoint;
    gradient.endPoint = endPoint;
    [layer addSublayer:gradient];
    
}


/**
 view转成image

 @param view view
 @param transparent 是否透明
 @return image
 */
+ (UIImage *)ui_ViewToImageView:(UIView*)view transparent:(BOOL)transparent{
    CGSize size = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, transparent, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/**
 给UILabel设置颜色

 @param label label
 @param color 颜色
 @param range 范围
 */
+ (void)ui_labelColor:(UILabel *)label color:(UIColor *)color range:(NSRange)range{
    
    NSMutableAttributedString *AttributedStr = nil;
    if (label.attributedText == nil) {
        AttributedStr = [[NSMutableAttributedString alloc] initWithString:label.text];
    }else {
        AttributedStr = [label.attributedText mutableCopy];
    }
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    label.attributedText = AttributedStr;
}

/**
 给UILabel设置字体
 
 @param label label
 @param font 字体
 @param range 范围
 */
+ (void)ui_labelFont:(UILabel *)label font:(UIFont *)font range:(NSRange)range{
    NSMutableAttributedString *AttributedStr = nil;
    if (label.attributedText == nil) {
        AttributedStr = [[NSMutableAttributedString alloc] initWithString:label.text];
    }else {
        AttributedStr = [label.attributedText mutableCopy];
    }
    [AttributedStr addAttribute:NSFontAttributeName value:font range:range];
    label.attributedText = AttributedStr;
}

@end
