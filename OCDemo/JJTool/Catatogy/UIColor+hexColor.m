//
//  UIColor+hexColor.m
//  YiKuaiYunGou
//
//  Created by 彭亮 on 16/3/8.
//  Copyright © 2016年 PengLiang. All rights reserved.
//

#import "UIColor+hexColor.h"

@implementation UIColor (hexColor)

+ (UIColor *)hexFloatColor:(NSString *)hexStr {
    if (hexStr.length < 6)
        return nil;
    
    unsigned int red_, green_, blue_;
    NSRange exceptionRange;
    exceptionRange.length = 2;
    
    //red
    exceptionRange.location = 0;
    [[NSScanner scannerWithString:[hexStr substringWithRange:exceptionRange]]scanHexInt:&red_];
    
    //green
    exceptionRange.location = 2;
    [[NSScanner scannerWithString:[hexStr substringWithRange:exceptionRange]]scanHexInt:&green_];
    
    //blue
    exceptionRange.location = 4;
    [[NSScanner scannerWithString:[hexStr substringWithRange:exceptionRange]]scanHexInt:&blue_];
    
    UIColor *resultColor = [UIColor colorWithRed:red_ green:green_ blue:blue_ alpha:1.0];
    return resultColor;
}

@end
