//
//  NSObject+HaveValue.m
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "NSObject+HaveValue.h"

@implementation NSObject (HaveValue)

- (id)haveValue{
    if ([self isKindOfClass:[NSString class]]) {
        
        NSString *str = (NSString *)self;
        if (str.length > 0) {
            return str;
        }else {
            return nil;
        }
    }else if ([self isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *dic = (NSDictionary *)self;
        NSArray *keys = [dic allKeys];
        if (dic && keys.count > 0) {
            return dic;
        }else {
            return nil;
        }
    }else if ([self isKindOfClass:[NSArray class]]) {
        
        NSArray *arr = (NSArray *)self;
        if (arr && arr.count > 0) {
            return arr;
        }else {
            return nil;
        }
    }else if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *num = (NSNumber *)self;
        if (num) {
            return num;
        }else {
            return nil;
        }
    }
    
    return nil;
}

@end
