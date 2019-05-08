//
//  APRequestSerializer.h
//  AuctionProject
//
//  Created by 刘峰 on 2018/11/15.
//  Copyright © 2018年 刘峰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APRequestSerializer : NSObject

FOUNDATION_EXPORT NSString *APQueryStringFromParameters(NSDictionary *parameters);

@end

NS_ASSUME_NONNULL_END
