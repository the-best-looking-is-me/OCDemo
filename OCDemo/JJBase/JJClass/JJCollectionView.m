//
//  JJCollectionView.m
//  OCDemo
//
//  Created by yangchang on 2019/5/21.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import "JJCollectionView.h"

@interface JJCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>




@end

@implementation JJCollectionView

+ (JJCollectionView *)collectionView:(CGRect)rect
                              layout:(UICollectionViewLayout *)layout
                            cellSize:(CGSize)size
                           backColor:(UIColor *)backColor
                           direction:(YCCollectionDirection)direction
                         registerDic:(NSDictionary *)registerDic
{
//    JJCollectionView *jjView = [[JJCollectionView alloc] initWithFrame:rect];
//    _datas = [NSMutableArray array];
//
//    _collectionView = [YCUI ui_collectionView:jjView.bounds layout:layout cellSize:size backColor:backColor scrollDirection:direction delegate:jjView registerDic:registerDic];
//
//    [jjView addSubview:_collectionView];
    
    return nil;
}

@end
