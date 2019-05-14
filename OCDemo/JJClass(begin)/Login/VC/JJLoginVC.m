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
 
    self.navigationController.jz_navigationBarTintColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[JJBaseVC new] animated:YES];
}



@end
