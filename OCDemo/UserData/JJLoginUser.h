//
//  JJLoginUser.h
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJLoginUser : NSObject<NSCoding>


@property (nonatomic,copy) NSString *expireAt ; //1559890773392;
@property (nonatomic,assign) BOOL isBindMobile ; //1;
@property (nonatomic,assign) BOOL isNew ; //0;
@property (nonatomic,copy) NSString *platform ; //ANDROID;
@property (nonatomic,copy) NSString *token ; //a1d4ac4c9b7d43419a6c1c46c1021092;
@property (nonatomic,copy) NSString *userId ; //20008644;
@property (nonatomic,copy) NSString *wxLoginId ; //"<null>";


//保存用户数据
- (BOOL)saveData;
//获取用户数据
+ (JJLoginUser *)fetchData;
//清空用户数据
+ (BOOL)clearData;


@end

NS_ASSUME_NONNULL_END
