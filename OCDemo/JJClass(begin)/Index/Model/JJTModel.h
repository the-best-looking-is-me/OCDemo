//
//  JJModel.h
//  OCDemo
//
//  Created by yangchang on 2019/5/18.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJTModel : NSObject

@property (nonatomic,assign) NSInteger myid;
@property (nonatomic,copy) NSString * stamp;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * subtitle;
@property (nonatomic,copy) NSString * url;
@property (nonatomic,copy) NSString * vc;

@end

NS_ASSUME_NONNULL_END
