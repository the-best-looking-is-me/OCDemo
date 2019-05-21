//
//  JJAFNetworking.h
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJAFNetworking : NSObject

//登录
+ (void)jj_login:(NSDictionary *)dic block:(void(^)(id sth,id sth2))block;

//ios版本
+ (void)jj_fetchIosVersionBlock:(void(^)(id sth,id sth2))block;


@end

NS_ASSUME_NONNULL_END
