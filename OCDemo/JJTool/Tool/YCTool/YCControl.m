//
//  YCControl.m
//  OCDemo
//
//  Created by yangchang on 2019/5/30.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCControl.h"

@implementation YCControl


+ (UIView *)control_lineView:(CGRect)rect superView:(UIView *)superView lineColor:(UIColor *)lineColor{
    
    UIView *lineView = [[UIView alloc] initWithFrame:rect];
    
    if (superView) [superView addSubview:lineView];
    if (lineColor) {
        lineView.backgroundColor = lineColor;
    }else {
        lineView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    }
    
    return lineView;
}


+ (UIView *)control_View:(CGRect)rect superView:(UIView *)superView bgColor:(UIColor *)bgColor{
    
    UIView *view = [[UIView alloc] initWithFrame:rect];
    if (superView) [superView addSubview:view];
    if (bgColor) view.backgroundColor = bgColor;
    
    return view;
}

+ (UIView *)control_ViewBorder:(CGRect)rect superView:(UIView *)superView bgColor:(UIColor *)bgColor radius:(CGFloat)radius borderWidth:(CGFloat)bdWidth borderColor:(UIColor *)bdColor{
    
    UIView *view = [[UIView alloc] initWithFrame:rect];
    if (superView) [superView addSubview:view];
    if (bgColor) view.backgroundColor = bgColor;
    if (radius > 0) view.layer.cornerRadius = radius;
    if (bdWidth > 0) view.layer.borderWidth = bdWidth;
    if (bdColor) view.layer.borderColor = bdColor.CGColor;
    
    return view;
}

+ (UIImageView *)control_imgView:(CGRect)rect superView:(UIView *)superView localIma:(NSString *)imaPath{
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:rect];
    img.contentMode = UIViewContentModeScaleAspectFit;
    if (superView) [superView addSubview:img];
    if (imaPath.length > 0) img.image = [UIImage imageNamed:imaPath];
    
    return img;
}

+ (UIImageView *)control_imgViewBorder:(CGRect)rect superView:(UIView *)superView localIma:(NSString *)imaPath radius:(CGFloat)radius borderWidth:(CGFloat)bdWidth borderColor:(UIColor *)bdColor{
    
    //UIImageView *img = [[UIImageView alloc] initWithCornerRadiusAdvance:radius rectCornerType:UIRectCornerAllCorners];
    UIImageView *img = [[UIImageView alloc] initWithFrame:rect];
    if (imaPath.length > 0) img.image = [UIImage imageNamed:imaPath];
    if (radius > 0) {
        img.layer.cornerRadius = radius;
        img.layer.masksToBounds = YES;
    }
    if (bdWidth > 0) img.layer.borderWidth = bdWidth;
    if (bdColor) img.layer.borderColor = bdColor.CGColor;
    img.contentMode = UIViewContentModeScaleAspectFit;
    if (superView) [superView addSubview:img];
    
    return img;
}

+ (UIImageView *)control_imgViewClick:(CGRect)rect superView:(UIView *)superView localIma:(NSString *)imaPath block:(void(^)(UIImageView *img,id sth))click{
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:rect];
    img.userInteractionEnabled = YES;
    img.contentMode = UIViewContentModeScaleAspectFit;
    [superView addSubview:img];
    if (imaPath.length > 0) img.image = [UIImage imageNamed:imaPath];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (click) {
            click(img,sender);
        }
    }];
    [img addGestureRecognizer:tap];
    
    return img;
}

+ (UIButton *)control_btnTxt:(CGRect)rect superView:(UIView *)superView font:(UIFont *)font norColor:(UIColor *)norColor norTxt:(NSString *)nortxt click:(void (^)(UIButton *x))click{
    UIButton *btn = [YCUI ui_buttonSimple:rect font:font normalColor:norColor normalText:nortxt click:click];
    if (superView) [superView addSubview:btn];
    return btn;
}

+ (UIButton *)control_btnIma:(CGRect)rect superView:(UIView *)superView imaPath:(NSString *)imaPath click:(void (^)(UIButton *x))click{
    UIButton *btn = [YCUI ui_buttonSimple:rect font:nil normalColor:nil normalText:@"" click:click];
    [btn setImage:[UIImage imageNamed:imaPath] forState:UIControlStateNormal];
    if (superView) [superView addSubview:btn];
    return btn;
}

+ (UIButton *)control_btnTxtAndIma:(CGRect)rect superView:(UIView *)superView font:(UIFont *)font  norColor:(UIColor *)norColor norTxt:(NSString *)nortxt imaPath:(NSString *)imaPath txtType:(KButtonTxtType)type disTance:(CGFloat)disTance click:(void (^)(UIButton *x))click{
    UIButton *btn = [YCUI ui_button:rect font:font backColor:[UIColor whiteColor] cornerRadius:0 borderColor:nil borderWidth:0 normalColor:norColor selectColor:norColor normalText:nortxt selectText:nortxt click:click];
    if (imaPath.length > 0) [btn setImage:[UIImage imageNamed:imaPath] forState:UIControlStateNormal];
    
    CGFloat btnImgWidth = btn.imageView.size.width;
    CGFloat btnImgHeight = btn.imageView.size.height;
    
    CGFloat btnTitleWidth = btn.titleLabel.size.width;
    CGFloat btnTitleHeight = btn.titleLabel.size.height;
    
    if (type == KButtonTxtTypeLeft) {
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, - (btnImgWidth + disTance * 0.5), 0, btnImgWidth + disTance * 0.5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, btnTitleWidth + disTance * 0.5, 0, - (btnTitleWidth + disTance * 0.5) );
    }else if (type == KButtonTxtTypeTop) {
        btn.titleEdgeInsets = UIEdgeInsetsMake( -(btnTitleHeight * 0.5 + disTance * 0.5), -btnImgWidth * 0.5, + (btnTitleHeight * 0.5 + disTance * 0.5), btnImgWidth * 0.5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(+ (btnImgHeight * 0.5 + disTance * 0.5), btnTitleWidth * 0.5, - (btnImgHeight * 0.5 + disTance * 0.5), -btnTitleWidth * 0.5);
        
    }else if (type == KButtonTxtTypeBottom) {
        btn.titleEdgeInsets = UIEdgeInsetsMake(btnTitleHeight * 0.5 + disTance * 0.5, -btnImgWidth * 0.5, - (btnTitleHeight * 0.5 + disTance * 0.5), btnImgWidth * 0.5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(- (btnImgHeight * 0.5 + disTance * 0.5), btnTitleWidth * 0.5, btnImgHeight * 0.5 + disTance * 0.5, -btnTitleWidth * 0.5);
        
    }else if (type == KButtonTxtTypeRight) {
        //默认
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, + disTance * 0.5, 0, - disTance * 0.5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, - disTance * 0.5, 0, + disTance * 0.5 );
    }
    if (superView) [superView addSubview:btn];
    return btn;
}

+ (UILabel *)control_label:(CGRect)rect superView:(UIView *)superView lines:(NSInteger)lines align:(NSTextAlignment)align font:(UIFont *)font textColor:(UIColor *)color text:(NSString *)text click:(void (^)(UILabel *x,id sth))click{
    UILabel *label = [YCUI ui_label:rect lines:lines align:align font:font textColor:color text:text];
    if (superView) [superView addSubview:label];
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (click) {
            click(label,sender);
        }
    }];
    [label addGestureRecognizer:tap];
    label.backgroundColor = [UIColor clearColor];
    
    //自适应一下
    //[label sizeToFit];
    
    return label;
}


@end







