//
//  JJBaseVC.h
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJBaseVC : UIViewController{
    UIView *_naviView;
}

//导航条View
@property (nonatomic,strong) UIView *naviView;

//把导航条View拿到最前面
- (void)naviViewToFont;

@end

NS_ASSUME_NONNULL_END
