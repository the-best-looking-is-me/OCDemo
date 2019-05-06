//
//  JJBaseTabBarVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJBaseTabBarVC.h"

@interface JJBaseTabBarVC ()

@end

@implementation JJBaseTabBarVC

+ (void)initialize{
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    //    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers
{
    
    JJIndexPageVC *essence = [[JJIndexPageVC alloc] init];
    [self setupOneChildViewController:essence title:@"商品" image:@"tab_home_normal" selectedImage:@"tab_home_selected"];
    
    JJToolPageVC *new = [[JJToolPageVC alloc] init];
    [self setupOneChildViewController:new title:@"分类" image:@"tab_history_normal" selectedImage:@"tab_history_selected"];
    
    JJMePageVC *me = [[JJMePageVC alloc] init];
    [self setupOneChildViewController:me title:@"我的" image:@"tab_my_normal" selectedImage:@"tab_my_selected"];
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:[[JJBaseNaviVC alloc] initWithRootViewController:vc]];
}

@end
