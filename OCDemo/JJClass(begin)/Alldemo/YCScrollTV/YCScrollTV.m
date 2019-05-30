//
//  YCScrollTV.m
//  OCDemo
//
//  Created by yangchang on 2019/5/28.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCScrollTV.h"
#import "YCTVScrollView.h"

#define Kpage 3

@interface YCScrollTV ()

@end

@implementation YCScrollTV

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"滑动demo";
    
    YCTVScrollView *sv = [[YCTVScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, ScreenWidth, ScreenHeight - SafeAreaTopHeight - SafeAreaBottomHeight)];
    sv.pageNum = Kpage;
    sv.headView = [self createHeadView];
    sv.selectTapView = [self createSelectTapView];
    [sv setUI];
    [self.view addSubview:sv];
    
    [self naviViewToFont];
}

//头
- (UIView *)createHeadView{
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    head.backgroundColor = [UIColor lightGrayColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [head addGestureRecognizer:tap];
    
    return head;
}

- (void)click:(UITapGestureRecognizer *)tap{
    NSLog(@"点了头部");
}

//选择标签
- (UIView *)createSelectTapView{
    UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    
    CGFloat num = Kpage;
    
    CGFloat x = 0;
    CGFloat w = ScreenWidth / num;
    NSArray *colors = @[[UIColor yellowColor],[UIColor redColor],[UIColor blueColor]];
    for (NSInteger i = 0; i < num; i++) {
        UIButton *btn = [YCUI ui_buttonSimple:CGRectMake(x, 0, w, selectView.Height) font:[UIFont systemFontOfSize:14] normalColor:[UIColor blackColor] normalText:[NSString stringWithFormat:@"第%zd页",i] click:^(UIButton *x) {
            NSLog(@"%@",[NSString stringWithFormat:@"点了第%zd个按扭",x.tag]);
        }];
        btn.backgroundColor = colors[i]?:[UIColor lightGrayColor];
        btn.tag = i;
        [selectView addSubview:btn];
        x += w;
    }
    return selectView;
}



@end
