//
//  YCTestView.m
//  OCDemo
//
//  Created by yangchang on 2019/5/29.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "YCTestView.h"

@implementation YCTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"type = %zd,subtype = %zd,allTouches = %@",event.type,event.subtype,event.allTouches);
    NSLog(@"%@",[event touchesForView:self]);
    
    return self;
    
}

@end
