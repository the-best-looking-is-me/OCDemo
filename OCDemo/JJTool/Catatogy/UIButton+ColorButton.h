//
//  UIButton+ColorButton.h
//  AuctionProject
//
//  Created by yangchang on 2019/4/25.
//  Copyright © 2019 刘峰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ColorButton)


/**
 统一设置渐变颜色
 */
- (void)buttonColor;
- (void)buttonColorWithRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
