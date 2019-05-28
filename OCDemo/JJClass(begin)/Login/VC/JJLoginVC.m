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
    
    CGFloat maxY = 0;
    CGFloat x = 12;
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:sv];
    
    UIImageView *headImg = [YCUI ui_imageView:CGRectMake(0, 0, ScreenWidth, Adapted(332)) fileName:@""];
    [sv addSubview:headImg];
    
    
    [sv setContentSize:CGSizeMake(0, maxY)];
}

@end
