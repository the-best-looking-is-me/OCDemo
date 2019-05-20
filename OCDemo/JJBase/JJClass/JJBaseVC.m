//
//  JJBaseVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJBaseVC.h"


@interface JJBaseVC ()

@end

@implementation JJBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    UIView *barImageView = self.navigationController.navigationBar.subviews.firstObject;
    barImageView.backgroundColor = [UIColor clearColor];
    _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, SafeAreaTopHeight)];
    _naviView.backgroundColor = [UIColor yellowColor];
    _naviView.alpha = 0;
    [self.view addSubview:_naviView];
}

- (void)naviViewToFont{
    [self.view bringSubviewToFront:_naviView];
}

@end
