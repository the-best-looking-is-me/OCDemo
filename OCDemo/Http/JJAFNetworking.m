//
//  JJAFNetworking.m
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJAFNetworking.h"

@implementation JJAFNetworking

+ (void)jj_login:(NSDictionary *)dic block:(void(^)(id sth,id sth2))block{
    [[YCHttpTool sharedManager] postHttp:http_login dic:dic block:block];
}

+ (void)jj_fetchIosVersionBlock:(void(^)(id sth,id sth2))block{
    [[YCHttpTool sharedManager] getHttp:http_fetchIosVersion dic:nil block:block];
}

@end
