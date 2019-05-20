//
//  AppDelegate.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    if ([self isLogin]) {
        [self enter_mainVC];
    }else {
        [self enter_loginVC];
    }
    
    return YES;
}


/**
 判断是否已经登录过

 @return YES：登录过
 */
- (BOOL)isLogin{
    return YES;
}

/**
 进登录页
 */
- (void)enter_loginVC{
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = [[JJBaseNaviVC alloc] initWithRootViewController:[JJLoginVC new]];
}


/**
 进主页面
 */
- (void)enter_mainVC{
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = [[JJBaseTabBarVC alloc]init];
}




- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
