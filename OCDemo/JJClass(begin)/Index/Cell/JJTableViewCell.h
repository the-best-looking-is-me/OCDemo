//
//  JJTableViewCell.h
//  OCDemo
//
//  Created by yangchang on 2019/5/18.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJTModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView *bottomLine;

- (void)refreshUI:(JJTModel *)model;

@end

NS_ASSUME_NONNULL_END
