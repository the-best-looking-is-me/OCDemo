//
//  YCHttpTool.m
//  UIP
//
//  Created by th on 2018/3/1.
//  Copyright © 2018年 thgyuip. All rights reserved.
//

#import "YCHttpTool.h"
#import "APRequestSerializer.h"

@interface YCHttpTool ()

@end

@implementation YCHttpTool

//1:测试服务器 2正式服务器
+ (NSInteger)testInfo{
#pragma mark - 灵活配置可以做到随时切换测试正式服务器
    return 1;
//    return 2;
}

//配置baseUrl
+ (NSString *)baseUrl{
    if ([self testInfo] == 1) {
        return @"http://shop-api-test.rrhbull.com";
    }else if ([self testInfo] == 2) {
        return @"http://api.lexiangpaijinggou.com";
    }
    return @"";
}

+ (NSString *)chineseUrl{
    if ([self testInfo] == 1) {
        return @"测试";
    }else if ([self testInfo] == 2) {
        return @"正式";
    }
    return @"";
}

- (instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    }
    return self;
}

+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    static YCHttpTool *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YCHttpTool manager] initWithBaseURL:[NSURL URLWithString:[YCHttpTool baseUrl]]];
        
        if ([self testInfo] == 1) {
            //测试环境不添加https证书认证
        }else {
            [instance setSecurityPolicy:[self customSecurityPolicy]];
        }

    });
    return instance;
}

+ (AFSecurityPolicy *)customSecurityPolicy {
#pragma mark - 如有需要这儿需要配置
    // 先导入证书 证书由服务端生成，具体由服务端人员操作
    NSString *path = [[NSBundle mainBundle] pathForResource:@"public" ofType:@"cer"];//证书的路径 xx.cer
    NSData *cerData = [NSData dataWithContentsOfFile:path];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // AFSSLPinningModeNone: 代表客户端无条件地信任服务器端返回的证书。
    // AFSSLPinningModePublicKey: 代表客户端会将服务器端返回的证书与本地保存的证书中，PublicKey的部分进行校验；如果正确，才继续进行。
    // AFSSLPinningModeCertificate: 代表客户端会将服务器端返回的证书和本地保存的证书中的所有内容，包括PublicKey和证书部分，全部进行校验；如果正确，才继续进行。
    securityPolicy.allowInvalidCertificates = NO;
    // 是否允许无效证书（也就是自建的证书），默认为NO 如果是需要验证自建证书，需要设置为YES
    securityPolicy.validatesDomainName = YES;
    //validatesDomainName 是否需要验证域名，默认为YES;
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    return securityPolicy;
}


//在此方法里面添加请求公共参数
- (NSDictionary *)headerParameters{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
#pragma mark - 如有需要这儿需要配置
    /*
    if (self.loginModel && [self.loginModel.token isNotBlank]) {
        [parameters setObject:self.loginModel.token forKey:@"token"];
        [parameters setObject:@(self.loginModel.userId) forKey:@"uid"];
    }
    */
    
    //请求时间
    long long timestamp =  [[NSDate date] timeIntervalSince1970] * 1000;
    [parameters setObject:[NSString stringWithFormat:@"%lld",timestamp] forKey:@"timestamp"];
    //bundleId
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    [parameters setObject:bundleId forKey:@"bundleId"];
    //设备id
    //    [parameters setObject:[NSString staticDeviceId] forKey:@"deviceId"];
    //设备类型
    [parameters setObject:@"MOBILE" forKey:@"deviceType"];
    //设备型号
    [parameters setObject:[[UIDevice currentDevice] model] forKey:@"deviceModel"];
    //系统版本
    [parameters setObject:[UIDevice currentDevice].systemVersion forKey:@"osVersion:"];
    //系统类型
    [parameters setObject:@"IOS" forKey:@"osType"];
    //版本
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [parameters setObject:version forKey:@"appVersion"];
    //发布渠道
    
    if ([YCHttpTool testInfo] == 1) {
        [parameters setObject:@"DEBUG" forKey:@"releaseChannel"];
    }else {
        [parameters setObject:@"RELEASE" forKey:@"releaseChannel"];
    }

    return parameters;
}


- (NSString *)encryptionWithRequestParameter:(NSDictionary *)requestParameter
                               headParameter:(NSDictionary *)headParameter
                                  isBodyJosn:(BOOL)isBodyJson{
#pragma mark - 如有需要这行需要配置
    NSString *signature = @"2327B1FBDBC94DC3B149508A41347BEF";
    if (isBodyJson) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:headParameter];
        NSString *token = [dictionary objectForKey:@"token"];
        [dictionary removeObjectForKey:@"token"];
        NSString *sortString = APQueryStringFromParameters(dictionary);
        if ([token isNotBlank]) {
            sortString = [token stringByAppendingString:sortString];
        }
        NSString *bodyString = [requestParameter modelToJSONString];
        if ([bodyString isNotBlank]) {
            sortString = [sortString stringByAppendingString:bodyString];
        }
        NSString *encryption = [sortString stringByAppendingString:signature];
        return [encryption md5String];
    }else{
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary addEntriesFromDictionary:headParameter];
        [dictionary addEntriesFromDictionary:requestParameter];
        NSString *token = [dictionary objectForKey:@"token"];
        [dictionary removeObjectForKey:@"token"];
        NSString *sortString = APQueryStringFromParameters(dictionary);
        if ([token isNotBlank]) {
            sortString = [token stringByAppendingString:sortString];
        }
        NSString *encryption = [sortString stringByAppendingString:signature];
        return [encryption md5String];
    }
}

#pragma 公共方法get post

- (void)getHttp:(NSString *)url dic:(NSDictionary *)parameters block:(void(^)(id sth,id sth2))block{
    
    NSString *requestString = @"";
    requestString = [YCHttpTool baseUrl];
    requestString = [NSString stringWithFormat:@"%@%@",requestString,url];
    
    NSMutableDictionary *requestParameters = [NSMutableDictionary dictionary];
    
    //添加公共参数
    NSDictionary *headParameters = [self headerParameters];
    [requestParameters addEntriesFromDictionary:headParameters];
    
    //添加请求参数
    if (parameters && parameters.count > 0) {
        [requestParameters addEntriesFromDictionary:parameters];
    }
    
    if ([YCHttpTool testInfo] == 1) {
        //debug模式下不添加sign参数
    }else {
        NSString *signature = [self encryptionWithRequestParameter:parameters headParameter:headParameters isBodyJosn:NO];
        if ([signature isNotBlank]) {
            [requestParameters setObject:signature forKey:@"sign"];
        }
    }
    
    NSLog(@"\n *********** \n%@get地址 = %@\n *********** \n参数 = %@",[YCHttpTool chineseUrl],requestString,requestParameters);
    [self GET:requestString parameters:requestParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
        }
    }];
}

- (void)postHttp:(NSString *)url dic:(NSDictionary *)parameters block:(void(^)(id sth,id sth2))block{
    
    NSString *requestString = @"";
    requestString = [YCHttpTool baseUrl];
    requestString = [NSString stringWithFormat:@"%@%@",requestString,url];
    
    //公共参数
    NSDictionary *headParameters = [self headerParameters];
    
    //拼接参数
    NSString *string = AFQueryStringFromParameters(headParameters);
    requestString = [requestString stringByAppendingFormat:@"?%@",string];
    
    
    if ([YCHttpTool testInfo] == 1) {
        //debug模式下不添加sign参数
    }else {
        NSString *signature = [self encryptionWithRequestParameter:parameters headParameter:headParameters isBodyJosn:NO];
        if ([signature isNotBlank]) {
            requestString = [requestString stringByAppendingString:[NSString stringWithFormat:@"&sign=%@",signature]];
        }
    }
    
    NSLog(@"\n *********** \n%@post地址 = %@\n *********** \n参数 = %@",[YCHttpTool chineseUrl],requestString,parameters);
    [self POST:requestString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
        }
    }];
    
}


@end
