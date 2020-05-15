//
//  YACOBasicMacros.h
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/15.
//

#ifndef YACOBasicMacros_h
#define YACOBasicMacros_h

#import <Foundation/Foundation.h>

// 客户端App版本号
#define kYACOClientVersion                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


// System Size
#define kYACOScreenBounds                    ([UIScreen mainScreen].bounds)
#define kYACOScreenHeight                    ([UIScreen mainScreen].bounds.size.height)
#define kYACOScreenWidth                     ([UIScreen mainScreen].bounds.size.width)
#define kYACOScreenScale                     ([UIScreen mainScreen].scale)
#define kYACOSingleLineHeight                (1.f / [UIScreen mainScreen].scale)
#define kYACOStatusBarHeight                 [UIApplication sharedApplication].statusBarFrame.size.height
#define kYACONavigationBarHeight             (44.f)
#define kYACONavigationAndStatusBarHeight    (kYACOStatusBarHeight + kYACONavigationBarHeight)
#define kYACOTableViewBottomButtonHeight     (56.f)
#define kYACOScreenSafeBottomHeight \
({ \
    CGFloat bottom = 0.f; \
    if(@available(iOS 11.0, *)) { \
        bottom = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom; \
    } \
    (bottom); \
})




#define kYACOTabBarHeight                    (kYACOScreenSafeBottomHeight + 49.f)
#define kYACOScreenRealWidth                 kYACOScreenWidth * kYACOScreenScale
#define kYACOScreenRealHeight                kYACOScreenHeight * kYACOScreenScale

#define kYACOScreenAutoLayoutScale           (kYACOScreenWidth / 375)
#define kYACOScreenAutoLayoutScaleCeil(x)    ceilf(kYACOScreenAutoLayoutScale*(x))
#define kYACOScreenAutoWitdh(x)              (kYACOScreenAutoLayoutScale*(x))
#define kYACOScreenAutoHeight(x)             ((kYACOScreenHeight / 667) * (x))


#define kYACOSafeScreenHeight               (kYACOScreenHeight - kYACONavigationAndStatusBarHeight - kYACOTabBarHeight)


// iPhone X
#define kYACOScreenIsIPhoneX                 (kYACOScreenSafeBottomHeight ? YES : NO)

// 图片
#define kYACOImage(name)                     [UIImage imageNamed:name]

// 常用字体颜色
#define kYACOTextColorDefult                 [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
#define kYACOTextColorDeepGary               [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
#define kYACOTextColorGary                   [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]

// 常用颜色
#define kYACOGaryBackgroundColor             [UIColor colorWithRed:242/255.0 green:244/255.0 blue:246/255.0 alpha:1]
#define kYACOGaryLineColor                   [UIColor colorWithWhite:0 alpha:0.08]

// 操作系统版本号
#define kYACOCurrentSystemVersion            [[UIDevice currentDevice] systemVersion]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// DEBUG日志
#ifdef DEBUG
#define YACOLog(s,...) NSLog(@"<%p %@:(%d)>\n  %s\n  %@\n\n", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __func__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define YACOLog(s,...)
#endif


//#define kYACOAPPDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#endif /* YACOBasicMacros_h */
