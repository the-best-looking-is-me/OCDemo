//
//  MansoryUseVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/21.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "MansoryUseVC.h"
#import "YCTestView.h"

@interface MansoryUseVC ()

@end

@implementation MansoryUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"约束用法";
    
    YCTestView *t = [[YCTestView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:t];
}



@end
