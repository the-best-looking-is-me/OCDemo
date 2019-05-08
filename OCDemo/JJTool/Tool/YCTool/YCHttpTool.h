//
//  YCHttpTool.h
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

@interface YCHttpTool : AFHTTPSessionManager

+ (instancetype)sharedManager;


- (void)getHttp:(NSString *)url dic:(NSDictionary *)parameters block:(void(^)(id sth,id sth2))block;
- (void)postHttp:(NSString *)url dic:(NSDictionary *)parameters block:(void(^)(id sth,id sth2))block;


@end
