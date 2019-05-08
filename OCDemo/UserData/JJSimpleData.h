//
//  JJSimpleData.h
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJSimpleData : NSObject


/**
 存数据

 @param name 车库名字
 @param key 车位号
 @param value 车子
 */
+ (void)simpleSaveWithStoreHouseName:(NSString *)name key:(NSString *)key value:(id)value;

/**
 拿数据

 @param name 车库名字
 @param key 车位号
 @return 车子
 */
+ (id)simpleFetchWithStoreHouseName:(NSString *)name key:(NSString *)key;


/**
 移除某个车库内某个车位

 */
+ (void)simpleClearWithStoreHouseName:(NSString *)name key:(NSString *)key;


/**
 移除该车库内所有的车位
 */
+ (void)simpleClearAllWithStoreHouseName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
