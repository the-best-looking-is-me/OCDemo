//
//  JJIndexPageVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJIndexPageVC.h"

@implementation JJIndexPageVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [YCThreadSimple threadCountDownTime:10 block:^(NSInteger second) {
        NSLog(@"second = %zd",second);
    }];
}

@end
