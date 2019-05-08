//
//  JJLoginUser.m
//  OCDemo
//
//  Created by yangchang on 2019/5/8.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJLoginUser.h"

@implementation JJLoginUser

- (BOOL)saveData{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"loginUser"];
    return [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

+ (JJLoginUser *)fetchData{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"loginUser"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (BOOL)clearData{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"loginUser"];
    NSFileManager *file = [NSFileManager defaultManager];
    NSError *err = nil;
    [file removeItemAtPath:filePath error:&err];
    if (err) {
        return NO;
    }
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char *ivar = ivar_getName(ivars[i]);
        NSString *propretyName = [NSString stringWithUTF8String:ivar];
        [aCoder encodeObject:[self valueForKey:propretyName] forKey:propretyName];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            const char *ivar = ivar_getName(ivars[i]);
            NSString *propretyName = [NSString stringWithUTF8String:ivar];
            id value = [aDecoder decodeObjectForKey:propretyName];
            [self setValue:value forKey:propretyName];
        }
    }
    return self;
}

@end
