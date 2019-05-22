//
//  MansoryUseVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/21.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "MansoryUseVC.h"

@interface MansoryUseVC ()

@end

@implementation MansoryUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"约束用法";
    
    SNJJWEAK
    
    UIScrollView *sv = [YCUI ui_scrollView:CGRectZero];
    [self.view addSubview:sv];
    sv.backgroundColor = [UIColor redColor];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.and.right.and.mas_equalTo(weak.view);
        make.bottom.equalTo(weak.view).offset(SafeAreaBottomHeight);
        make.top.mas_equalTo(weak.view);
    }];
    
    CGFloat H = 100;
    UIView *oneView = [self createView];
    oneView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:oneView];
    oneView.frame = CGRectMake(0, 0, 200, H);
//    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(H);
//        make.left.and.right.mas_equalTo(sv);
//        make.top.mas_equalTo(sv);
//    }];
}

- (UIView *)createView{
    UIView *v = [YCUI ui_view:CGRectZero backgroundColor:[UIColor lightGrayColor] alpha:1 cornerRadius:0 borderWidth:0 borderColor:nil];
    v.backgroundColor = [UIColor lightGrayColor];
    return v;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
