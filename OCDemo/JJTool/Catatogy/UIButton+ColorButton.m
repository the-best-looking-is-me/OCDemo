//
//  UIButton+ColorButton.m
//  AuctionProject
//
//  Created by yangchang on 2019/4/25.
//  Copyright © 2019 刘峰. All rights reserved.
//

#import "UIButton+ColorButton.h"

@implementation UIButton (ColorButton)

- (void)buttonColor{
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    [self ui_gradientRect:view.frame layer:view.layer startPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1, 0.5) colorArray:@[RGB(255, 92, 65),RGB(255, 60, 78)]  locations:@[@(0.4),@(0.8)]];
    UIImage *image = [self ui_ViewToImageView:view transparent:YES];
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)buttonColorWithRect:(CGRect)rect{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    [self ui_gradientRect:view.frame layer:view.layer startPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1, 0.5) colorArray:@[RGB(255, 92, 65),RGB(255, 60, 78)]  locations:@[@(0.4),@(0.8)]];
    UIImage *image = [self ui_ViewToImageView:view transparent:YES];
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)ui_gradientRect:(CGRect)rect layer:(CALayer *)layer startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint colorArray:(NSArray<UIColor *> *)array locations:(NSArray <NSNumber *>*)locations{
    
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

- (UIImage *)ui_ViewToImageView:(UIView*)view transparent:(BOOL)transparent{
    CGSize size = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, transparent, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
