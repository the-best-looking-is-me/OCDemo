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
 传入两个NSDate,比较两者之间相差的时间

 @param oneDate 第一个时间 utc时间
 @param twoDate 第二个时间 utc时间
 @return dic集合 allSecond>=0:说明twoDate比oneDate时间线靠后，反之靠前
 */
+ (NSDictionary *)objectDifferDay:(NSDate *)oneDate withTwoDate:(NSDate *)twoDate{
    
    NSInteger second = [twoDate timeIntervalSinceDate:oneDate];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:@(second) forKey:@"allSecond"];
    if (second >= 0) {
        //twoDate 比 oneDate 时间线靠后
    }else {
        //twoDate 比 oneDate 时间线靠前
    }
    
    //求出相差 年月日 时分秒
    NSInteger minuteSecond = 60;
    NSInteger hourSecond = minuteSecond * minuteSecond;
    NSInteger daySecond = 24 * hourSecond;
    
    NSInteger day = second / daySecond;//天数
    NSInteger hh = second % daySecond / hourSecond;//小时
    NSInteger minute = second % daySecond % hourSecond / minuteSecond;//分
    NSInteger s = second % minuteSecond;//秒
    
    //NSLog(@"%zd %02zd:%02zd:%02zd",day,hh,minute,s);
    [dic setObject:@(day) forKey:@"day"];
    [dic setObject:@(hh) forKey:@"hour"];
    [dic setObject:@(minute) forKey:@"minute"];
    [dic setObject:@(s) forKey:@"second"];
    
    return dic;
}


/**
 时间戳（秒）转时间对象
 @param timeStamp 时间戳
 @return NSDateComponents 时间对象
 */
+ (NSDateComponents *)object_timeStamp:(NSString *)timeStamp{
    NSDate *now = [self object_UTCDateFromTimeStamap:timeStamp];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    return dateComponent;
   //获取方法
    /*
    NSInteger year = [dateComponent year];
    NSInteger month =  [dateComponent month];
    NSInteger day = [dateComponent day];
    NSInteger hour =  [dateComponent hour];
    NSInteger minute =  [dateComponent minute];
    NSInteger second = [dateComponent second];
     */
}


/**
 时间戳(秒)转utc时间

 @param timeStamap 时间戳 秒
 @return utcNSDate
 */
+ (NSDate *)object_UTCDateFromTimeStamap:(NSString *)timeStamap{
    NSTimeInterval timeInterval = [timeStamap doubleValue];
    //  /1000;传入的时间戳timeStamap如果是精确到毫秒的记得要/1000
    NSDate *UTCDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return UTCDate;
}


/**
 时间戳转utc时间字符串

 @param timeStamap 时间戳(秒)
 @param symbol 标志: -(0000-00-00 00:00:00),/(0000/00/00 00:00:00)
 @return 时间字符串
 */
+ (NSString *)object_UTCDateStrFromTimeStamap:(NSString *)timeStamap symbol:(NSString *)symbol{
    
    NSDateComponents *dateComponent = [self object_timeStamp:timeStamap];
    
    NSInteger year = [dateComponent year];
    NSInteger month =  [dateComponent month];
    NSInteger day = [dateComponent day];
    NSInteger hour =  [dateComponent hour];
    NSInteger minute =  [dateComponent minute];
    NSInteger second = [dateComponent second];
    
    if ([symbol isEqualToString:@"-"]) {
        
    }else if ([symbol isEqualToString:@"/"]) {
        
    }else {
        symbol = @"-";
    }
    NSString *timeStr = [NSString stringWithFormat:@"%zd%@%02zd%@%02zd %02zd:%02zd:%02zd",year,symbol,month,symbol,day,hour,minute,second];
    
    return timeStr;
}

/**
 NSDate转时间戳
 
 @param date utc时间
 @return 秒
 */
+ (NSString *)object_stamapFromDate:(NSDate *)date{
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}


/**
 NSDate转时间字符串
 
 @param date utc时间
 @param symbol 标志: -(0000-00-00 00:00:00),/(0000/00/00 00:00:00)
 @return 时间字符串
 */
+ (NSString *)object_TimeStrFromDate:(NSDate *)date symbol:(NSString *)symbol{
    
    NSString *stamp = [self object_stamapFromDate:date];
    return [self object_UTCDateStrFromTimeStamap:stamp symbol:symbol];
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



@end
