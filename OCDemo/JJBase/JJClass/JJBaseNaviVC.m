//
//  JJBaseNaviVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJBaseNaviVC.h"

#define JJBaseVC_navibgColor [UIColor redColor]
//#define JJBaseVC_navibgColor [UIColor whiteColor]


@interface JJBaseNaviVC ()

@end

@implementation JJBaseNaviVC


- (void)viewDidLoad{
    [super viewDidLoad];
    
}
//+ (void)initialize{}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (self.childViewControllers.count) {
//        viewController.hidesBottomBarWhenPushed = YES;
//
//        UIButton *button = [[UIButton alloc] init];
//        [button setImage:[UIImage imageNamed:@"navi_navigationButtonReturn"] forState:UIControlStateNormal];
//        //[button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [button setTitle:@"" forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        button.bounds = CGRectMake(0, 0, 70, 30);
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
//        button.titleLabel.font = [UIFont systemFontOfSize:15];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    }
//
//    [super pushViewController:viewController animated:animated];
//}
//
//- (void)back
//{
//    [self popViewControllerAnimated:YES];
//}


@end
