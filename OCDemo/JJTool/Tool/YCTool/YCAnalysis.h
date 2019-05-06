//
//  YCAnalysis.h
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCAnalysis : NSObject

#pragma mark - 时间转换处理

/**
 传入两个NSDate,比较两者之间相差的天数，时，分，秒
 
 @param oneDate 第一个时间 utc时间
 @param twoDate 第二个时间 utc时间
 @return dic集合 allSecond>=0:说明twoDate比oneDate时间线靠后，反之靠前
 */
+ (NSDictionary *)objectDifferDay:(NSDate *)oneDate withTwoDate:(NSDate *)twoDate;

/**
 时间戳（秒）转时间对象
 
 @param timeStamp 时间戳
 @return NSDateComponents 时间对象(可单独获取年 月 日 时 分 秒)
 */
+ (NSDateComponents *)object_timeStamp:(NSString *)timeStamp;

/**
 时间戳(秒)转utc时间NSDate
 
 @param timeStamap 时间戳 秒
 @return utcNSDate
 */
+ (NSDate *)object_UTCDateFromTimeStamap:(NSString *)timeStamap;

/**
 时间戳转utc时间字符串
 
 @param timeStamap 时间戳(秒)
 @param symbol 标志: -(0000-00-00 00:00:00),/(0000/00/00 00:00:00)
 @return 时间字符串
 */
+ (NSString *)object_UTCDateStrFromTimeStamap:(NSString *)timeStamap symbol:(NSString *)symbol;


/**
 NSDate转时间戳

 @param date utc时间
 @return 秒
 */
+ (NSString *)object_stamapFromDate:(NSDate *)date;


/**
 NSDate转时间字符串

 @param date utc时间
 @param symbol 标志: -(0000-00-00 00:00:00),/(0000/00/00 00:00:00)
 @return 时间字符串
 */
+ (NSString *)object_TimeStrFromDate:(NSDate *)date symbol:(NSString *)symbol;


#pragma mark - 对象转换处理

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
