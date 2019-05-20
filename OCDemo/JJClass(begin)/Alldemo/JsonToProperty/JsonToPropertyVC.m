//
//  JsonToPropertyVC.m
//  OCDemo
//
//  Created by yangchang on 2019/5/20.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JsonToPropertyVC.h"
#import "JsonToPropertyModel.h"

@interface JsonToPropertyVC ()

@end

@implementation JsonToPropertyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"看控制台";
    
    //假数据
    NSDictionary *dic = @{
                          @"arr" : @[],
                          @"arr2" : @[
                                  @"1",
                                  @"2",
                                  @"3"
                                  ],
                          @"dic" : @{},
                          @"dic2" : @{
                                  @"1" : @"2"
                                  },
                          @"float1" : [NSNumber numberWithFloat:1.2],
                          @"float2" : [NSNumber numberWithFloat:12],
                          @"intType" : [NSNumber numberWithInteger:1],
                          @"str" : @"这是一条字符串",
                          @"str2" : @"",
                          @"boolType":[NSNumber numberWithBool:YES]
                          };
    
    //1.看看控制台的打印信息，用这些快速建立一个模型
    [YCAnalysis objectCreateProperty:dic DicUseID:NO];
    //2.然后快速dic转成模型
    JsonToPropertyModel *model = [JsonToPropertyModel mj_objectWithKeyValues:dic];
    NSLog(@"model = %@",model.str);
    
}



@end
