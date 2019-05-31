//
//  YCControl.h
//  OCDemo
//
//  Created by yangchang on 2019/5/30.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+CornerRadius.h"

typedef enum : NSUInteger {
    KButtonTxtTypeRight = 0,
    KButtonTxtTypeTop,
    KButtonTxtTypeLeft,
    KButtonTxtTypeBottom,
} KButtonTxtType;

NS_ASSUME_NONNULL_BEGIN

@interface YCControl : NSObject

#pragma mark - UIView (细线,UIView,圆角)
/**
 生成细线

 @param rect 细线尺寸
 @param superView 父类
 @param lineColor 线颜色
 @return 细线
 */
+ (UIView *)control_lineView:(CGRect)rect superView:(UIView *)superView lineColor:(UIColor *)lineColor;


/**
 创建View

 @param rect 尺寸
 @param superView 父类
 @param bgColor 背景色
 @return view
 */
+ (UIView *)control_View:(CGRect)rect superView:(UIView *)superView bgColor:(UIColor *)bgColor;


/**
 创建View - 圆角

 @param rect 尺寸
 @param superView 父类
 @param bgColor 背景色
 @param radius 圆角半径
 @param bdWidth 边界宽度
 @param bdColor 边界颜色
 @return view
 */
+ (UIView *)control_ViewBorder:(CGRect)rect superView:(UIView *)superView bgColor:(UIColor *)bgColor radius:(CGFloat)radius borderWidth:(CGFloat)bdWidth borderColor:(UIColor *)bdColor;

#pragma mark - UIImageView (ima,圆角,点击)
/**
 创建imgView

 @param rect 尺寸
 @param superView 父类
 @param imaPath 本地图片地址
 @return imgView
 */
+ (UIImageView *)control_imgView:(CGRect)rect superView:(UIView *)superView localIma:(NSString *)imaPath;


/**
 创建imgView 圆角

 @param rect 尺寸
 @param superView 父类
 @param imaPath 本地路径
 @param radius 半径
 @param bdWidth 边界宽度
 @param bdColor 边界颜色
 @return imgView
 */
+ (UIImageView *)control_imgViewBorder:(CGRect)rect superView:(UIView *)superView localIma:(NSString *)imaPath radius:(CGFloat)radius borderWidth:(CGFloat)bdWidth borderColor:(UIColor *)bdColor;

/**
 创建imgView - 点击

 @param rect 尺寸
 @param superView 父类
 @param imaPath 本地图片地址
 @param click 点击回调
 @return imgView
 */
+ (UIImageView *)control_imgViewClick:(CGRect)rect superView:(UIView *)superView localIma:(NSString *)imaPath block:(void(^)(UIImageView *img,id sth))click;


#pragma mark - UIbutton (文字,图片,组合,圆角)

/**
 创建button - 文字

 @param rect 尺寸
 @param superView 父类
 @param font 字体
 @param norColor 正常文字颜色
 @param nortxt 正常文字
 @param click 事件
 @return button
 */
+ (UIButton *)control_btnTxt:(CGRect)rect superView:(UIView *)superView font:(UIFont *)font norColor:(UIColor *)norColor norTxt:(NSString *)nortxt click:(void (^)(UIButton *x))click;



/**
 创建button - 图片

 @param rect 尺寸
 @param superView 父类
 @param imaPath 本地图片路径
 @param click 事件
 @return button
 */
+ (UIButton *)control_btnIma:(CGRect)rect superView:(UIView *)superView imaPath:(NSString *)imaPath click:(void (^)(UIButton *x))click;


/**
 创建button - 组合

 @param rect 尺寸
 @param superView 父类
 @param font 字体
 @param norColor 正常字体颜色
 @param nortxt 正常字
 @param imaPath 本地图片地址
 @param type 汉字所处的方位
 @param disTance 汉字与图片的距离
 @param click 事件
 @return button
 */
+ (UIButton *)control_btnTxtAndIma:(CGRect)rect superView:(UIView *)superView font:(UIFont *)font  norColor:(UIColor *)norColor norTxt:(NSString *)nortxt imaPath:(NSString *)imaPath txtType:(KButtonTxtType)type disTance:(CGFloat)disTance click:(void (^)(UIButton *x))click;

#pragma mark - UIlabe (一行，两行)

/**
 创建Label

 @param rect 尺寸
 @param superView 父类
 @param lines 行数
 @param align 对齐
 @param font 字体
 @param color 字体颜色
 @param text 文字
 @param click 事件
 @return label
 */
+ (UILabel *)control_label:(CGRect)rect superView:(UIView *)superView lines:(NSInteger)lines align:(NSTextAlignment)align font:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text click:(void (^)(UILabel *x,id sth))click;








@end

NS_ASSUME_NONNULL_END
