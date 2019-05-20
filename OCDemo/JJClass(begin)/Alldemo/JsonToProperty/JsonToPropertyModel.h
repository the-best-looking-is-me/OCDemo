//
//  JsonToPropertyModel.h
//  OCDemo
//
//  Created by yangchang on 2019/5/20.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonToPropertyModel : NSObject

@property (nonatomic,assign) CGFloat float2;
@property (nonatomic,copy) NSString * str2;
@property (nonatomic,copy) NSArray * arr;
@property (nonatomic,copy) NSDictionary * dic;
@property (nonatomic,copy) NSArray * arr2;
@property (nonatomic,copy) NSDictionary * dic2;
@property (nonatomic,assign) CGFloat float1;
@property (nonatomic,assign) NSInteger intType;
@property (nonatomic,copy) NSString * str;

@end

NS_ASSUME_NONNULL_END
