//
//  JJMacro.h
//  OCDemo
//
//  Created by yangchang on 2019/5/3.
//  Copyright © 2019 yangchang. All rights reserved.
//

#ifndef JJMacro_h
#define JJMacro_h

//APP
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define AppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define DeviceMode [[UIDevice currentDevice] model]

//安全区域
#define SafeAreaTopHeight ((ScreenHeight >= 812.0) && [[UIDevice currentDevice].model isEqualToString:@"iPhone"] ? 88 : 64)
#define SafeAreaBottomHeight ((ScreenHeight >= 812.0) && [[UIDevice currentDevice].model isEqualToString:@"iPhone"]  ? 30 : 0)

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//Frame
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define StatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kDefaultNavBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44.0)

//不同屏幕尺寸适配,UI : 750x1334
#define kScreenWidthRatio  (ScreenWidth / 375.0)
#define kScreenHeightRatio (ScreenHeight / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R) AdaptedWidth(R)
#define Adapted(x) ceilf((x) * kScreenWidthRatio)

#define SNJJWEAK __weak typeof(self) weak = self;

//测试色
#define KKTestColor [UIColor redColor]

//深一点
#define KKGrayColor RGBA(28, 163, 253, 1)
//主色调
#define KKlitteGrayColor RGBA(28, 203, 253, 1)

//候选字
#define KKTextPlaceStrColor RGBA(217, 217, 217, 1)

#endif /* JJMacro_h */
