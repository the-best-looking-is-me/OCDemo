//
//  YCAnalysis.m
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import "YCAnalysis.h"

@implementation YCAnalysis


/**
 jsonStr转对象

 @param jsonStr json字符串
 @return 对象
 */
+ (id)objectWithString:(NSString *)jsonStr{
    if (!jsonStr || jsonStr.length < 1) {
        return nil;
    }
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
}


/**
 二进制转对象

 @param data 二进制内容
 @return 对象
 */
+ (id)objectWidthData:(NSData *)data{
    if (!data) {
        return nil;
    }
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}


/**
 时间戳转特定格式字符串

 @param timeStamp 时间戳
 @param formmater 时间格式
 @return 字符串
 */
+ (NSString *)object_timeStamp:(NSString *)timeStamp withFormmatter:(NSString *)formmater{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formmater];
    return [formatter stringFromDate:date];
}



/**
 数组转字符串

 @param array 数组
 @return 字符串
 */
+ (NSString *)object_toJSONStringWithArray:(NSArray *)array{
    
    if (!array) return nil;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:array
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}


/**
 字典转字符串

 @param dic 字典
 @return 字符串
 */
+ (NSString *)object_toJSONStringWithDictionary:(NSDictionary *)dic{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


@end
