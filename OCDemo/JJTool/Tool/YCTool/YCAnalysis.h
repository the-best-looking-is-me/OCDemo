//
//  YCAnalysis.h
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCAnalysis : NSObject

/**
 jsonStr转对象
 
 @param jsonStr json字符串
 @return 对象
 */
+ (id)objectWithString:(NSString *)jsonStr;


/**
 二进制转对象
 
 @param data 二进制内容
 @return 对象
 */
+ (id)objectWidthData:(NSData *)data;

/**
 时间戳转特定格式字符串
 
 @param timeStamp 时间戳
 @param formmater 时间格式
 @return 字符串
 */
+ (NSString *)object_timeStamp:(NSString *)timeStamp withFormmatter:(NSString *)formmater;

/**
 数组转字符串
 
 @param array 数组
 @return 字符串
 */
+ (NSString *)object_toJSONStringWithArray:(NSArray *)array;

/**
 字典转字符串
 
 @param dic 字典
 @return 字符串
 */
+ (NSString *)object_toJSONStringWithDictionary:(NSDictionary *)dic;




@end
