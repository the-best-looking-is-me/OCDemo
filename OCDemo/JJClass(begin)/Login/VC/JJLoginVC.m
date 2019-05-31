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
    
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, ScreenWidth, ScreenHeight - SafeAreaTopHeight - SafeAreaBottomHeight)];
    [self.view addSubview:sv];
    CGFloat y = 30;
    
    //细线
    [YCControl control_lineView:CGRectMake(0, y, 200, 1) superView:sv lineColor:nil];
    
    y += 10;
    
    
    //view
    [YCControl control_View:CGRectMake(0, y, 200, 20) superView:sv bgColor:[UIColor redColor]];
    
    y += 30;
    
    //边角
    [YCControl control_ViewBorder:CGRectMake(0, y, 200, 20) superView:sv bgColor:[UIColor redColor] radius:4 borderWidth:1 borderColor:[UIColor yellowColor]];
    
    y += 30;
    
    //图片
    [YCControl control_imgView:CGRectMake(0, y, 100, 100) superView:sv localIma:@"tab_history_selected"];
    
    y += 120;
 
    //图片带点击
    [YCControl control_imgViewClick:CGRectMake(0, y, 100, 100) superView:sv localIma:@"tab_history_selected" block:^(UIImageView *img,id sth) {
        NSLog(@"图片带点击");
    }];
    
    y += 120;
    
    //图片带圆角
    [YCControl control_imgViewBorder:CGRectMake(0, y, 100, 100) superView:sv localIma:@"tab_history_selected" radius:50 borderWidth:10 borderColor:[UIColor redColor]];
    
    y += 120;
    
    //按扭文字
    [YCControl control_btnTxt:CGRectMake(0, y, 100, 100) superView:sv font:[UIFont systemFontOfSize:14] norColor:[UIColor redColor] norTxt:@"点我" click:^(UIButton *x) {
        NSLog(@"按扭文字");
    }];
    
    y += 120;
    
    //按扭图片
    [YCControl control_btnIma:CGRectMake(0, y, 100, 100) superView:sv imaPath:@"tab_history_selected" click:^(UIButton * _Nonnull x) {
        NSLog(@"按扭图片");
    }];
    
    y += 120;
    
    //按扭文字在右
    UIButton *btn_right = [YCControl control_btnTxtAndIma:CGRectMake(0, y, 100, 100) superView:sv font:[UIFont systemFontOfSize:18] norColor:[UIColor blackColor] norTxt:@"点我一" imaPath:@"tab_history_selected" txtType:KButtonTxtTypeRight disTance:10 click:^(UIButton * _Nonnull x) {
        NSLog(@"点我 =%@",x.titleLabel.text);
    }];
    btn_right.backgroundColor = [UIColor lightGrayColor];
    
    y += 120;
    
    //按扭文字在左
    UIButton *btn_left = [YCControl control_btnTxtAndIma:CGRectMake(0, y, 200, 100) superView:sv font:[UIFont systemFontOfSize:18] norColor:[UIColor blackColor] norTxt:@"点我一" imaPath:@"tab_history_selected" txtType:KButtonTxtTypeLeft disTance:10 click:^(UIButton * _Nonnull x) {
        NSLog(@"点我 =%@",x.titleLabel.text);
    }];
    btn_left.backgroundColor = [UIColor lightGrayColor];
    
    y += 120;
    
    //按扭文字在上
    UIButton *btn_top = [YCControl control_btnTxtAndIma:CGRectMake(0, y, 100, 100) superView:sv font:[UIFont systemFontOfSize:18] norColor:[UIColor blackColor] norTxt:@"点我一" imaPath:@"tab_history_selected" txtType:KButtonTxtTypeTop disTance:10 click:^(UIButton * _Nonnull x) {
        NSLog(@"点我 =%@",x.titleLabel.text);
    }];
    btn_top.backgroundColor = [UIColor lightGrayColor];
    
    y += 120;
    
    //按扭文字在下
    UIButton *btn_bottom = [YCControl control_btnTxtAndIma:CGRectMake(0, y, 100, 100) superView:sv font:[UIFont systemFontOfSize:18] norColor:[UIColor blackColor] norTxt:@"点我一" imaPath:@"tab_history_selected" txtType:KButtonTxtTypeBottom disTance:10 click:^(UIButton * _Nonnull x) {
        NSLog(@"点我 =%@",x.titleLabel.text);
    }];
    btn_bottom.backgroundColor = [UIColor lightGrayColor];
    
    y += 120;
    
    //
    UILabel *label = [YCControl control_label:CGRectMake(12, y, ScreenWidth - 24, 64) superView:sv lines:0 align:NSTextAlignmentLeft font:[UIFont systemFontOfSize:16] textColor:[UIColor redColor] text:@"我是中国人我是中国人我是中国人我是中国人我是中国人我是中国人ttt" click:^(UILabel * _Nonnull x, id  _Nonnull sth) {

    }];
    [label setBackgroundColor:[UIColor lightGrayColor]];
    
    y += 120;
    
    
    
    
    //最后一行
    [sv setContentSize:CGSizeMake(0, y)];
}

@end
