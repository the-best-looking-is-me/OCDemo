//
//  UIView+Frame.m
//  demo201608
//
//  Created by LoveYC on 8/5/16.
//  Copyright © 2016 LoveYC. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)MinX{
    return  CGRectGetMinX(self.frame);
}

- (CGFloat)MinY{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)Width{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)Height{
    return CGRectGetHeight(self.frame);
}

- (CGFloat)MidX{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)MidY{
    return  CGRectGetMidY(self.frame);
}

- (CGFloat)MaxX{
    return  CGRectGetMaxX(self.frame);
}

- (CGFloat)MaxY{
    return CGRectGetMaxY(self.frame);
}


@end
