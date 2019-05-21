//
//  JJLoginVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/13.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJLoginVC.h"

@interface JJLoginVC ()

@end

@implementation JJLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI{
    
//    UIImageView *headImgView = [YCUI ui_imageView:CGRectMake(0, 0, ScreenWidth, ScreenWidth) fileName:@""];
//    headImgView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:headImgView];
//
//    UIImageView *circleImgView = [YCUI ui_imageView:CGRectMake(0, 0, 100, 100) fileName:@""];
//    circleImgView.backgroundColor = [UIColor whiteColor];
//    circleImgView.center = CGPointMake(headImgView.Width * 0.5, headImgView.Height * 0.5);
//    [headImgView addSubview:circleImgView];
//
//    NSArray *leftImg = @[@"",@"",@""];
//    NSArray *centerPlaceStr = @[@"请输入手机号",@"请输入登录密码",@"请输入验证码"];
//    CGFloat y = headImgView.maxY + 30;
//    CGFloat rowH = 40;
//    for (NSInteger i=0; i<leftImg.count; i++) {
//        UIView *rowView = [YCUI ui_view:CGRectMake(0, y, ScreenWidth, rowH) backgroundColor:[UIColor clearColor] alpha:1 cornerRadius:0 borderWidth:0 borderColor:nil];
//        [self.view addSubview:rowView];
//
//        //左
//        CGFloat rowX = 12;
//        UIImageView *leftimgView = [YCUI ui_imageView:CGRectMake(0, 0, 30, 30) fileName:leftImg[i]];
//        leftimgView.backgroundColor = [UIColor redColor];
//        leftimgView.center = CGPointMake(rowX + leftimgView.Width * 0.5, rowView.Height * 0.5);
//        [rowView addSubview:leftimgView];
//
//        //输入框
//        UITextField *f = [YCUI ui_textField:CGRectMake(leftimgView.maxX + 4 ,0, rowView.Width - (leftimgView.maxX + 4) * 2, rowView.Height) textColor:[UIColor blackColor] backColor:[UIColor clearColor] font:[UIFont systemFontOfSize:18] maxTextNum:20 placeholderColor:[UIColor lightGrayColor] placeholder:centerPlaceStr[i] toMaxNum:^(UITextField * _Nonnull textField) {
//
//        } change:^(UITextField * _Nonnull textField) {
//
//        }];
//        [rowView addSubview:f];
//
//        //细线
//        UIView *lineView = [YCUI ui_view:CGRectMake(f.MinX, f.maxY, f.Width, 1) backgroundColor:[UIColor lightGrayColor] alpha:1 cornerRadius:0 borderWidth:0 borderColor:nil];
//        [rowView addSubview:lineView];
//
//        y = y + rowView.Height;
//    }
//
//    //登录
//    CGFloat btnH = 40;
//    UIButton *btn = [YCUI ui_button:CGRectMake(0, 0, ScreenWidth * 0.85, btnH) font:[UIFont systemFontOfSize:18] backColor:[UIColor clearColor] cornerRadius:btnH * 0.5 borderColor:[UIColor clearColor] borderWidth:1 normalColor:[UIColor whiteColor] selectColor:[UIColor lightGrayColor] normalText:@"登录" selectText:@"登录" click:^(id  _Nonnull x) {
//
//    }];
//    btn.layer.masksToBounds = YES;
//    btn.center = CGPointMake(ScreenWidth * 0.5, y + 60);
//    [self.view addSubview:btn];
//    [btn buttonColor];
//
//    {
//        UIButton *leftBtn = [YCUI ui_buttonSimple:CGRectMake(btn.MinX, btn.maxY, 100, 30) font:[UIFont systemFontOfSize:16] normalColor:[UIColor redColor] normalText:@"还没有账号？" click:^(id  _Nonnull x) {
//
//        }];
//        leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [self.view addSubview:leftBtn];
//
//        UIButton *rightBtn = [YCUI ui_buttonSimple:CGRectMake(btn.maxX - 60, btn.maxY, 80, 30) font:[UIFont systemFontOfSize:16] normalColor:[UIColor redColor] normalText:@"忘记密码" click:^(id  _Nonnull x) {
//
//        }];
//        leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//        [self.view addSubview:rightBtn];
//    }
//
//
}

@end
