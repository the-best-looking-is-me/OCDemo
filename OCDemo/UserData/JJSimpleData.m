//
//  JJSimpleData.m
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJSimpleData.h"

@implementation JJSimpleData

+ (void)simpleSaveWithStoreHouseName:(NSString *)name key:(NSString *)key value:(id)value{
    
    YYCache *yyCache = [YYCache cacheWithName:name];
    [yyCache setObject:value forKey:key];
}

+ (id)simpleFetchWithStoreHouseName:(NSString *)name key:(NSString *)key{
    YYCache *yyCache = [YYCache cacheWithName:name];
    return [yyCache objectForKey:key];
}

+ (void)simpleClearWithStoreHouseName:(NSString *)name key:(NSString *)key{
    YYCache *yyCache = [YYCache cacheWithName:name];
    [yyCache removeObjectForKey:key];
}

+ (void)simpleClearAllWithStoreHouseName:(NSString *)name{
    YYCache *yyCache = [YYCache cacheWithName:name];
    [yyCache removeAllObjects];
}

@end
