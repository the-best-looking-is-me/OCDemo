//
//  JJCollectionView.h
//  OCDemo
//
//  Created by yangchang on 2019/5/21.
//  Copyright © 2019 yangchang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJCollectionView : UIView

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *datas;

@end

NS_ASSUME_NONNULL_END
