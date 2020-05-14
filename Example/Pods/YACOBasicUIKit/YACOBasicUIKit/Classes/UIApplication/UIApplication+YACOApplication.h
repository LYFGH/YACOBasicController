//
//  UIApplication+YACOApplication.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (YACOApplication)
// 获取当前活跃的UIViewController
- (UIViewController *)yaco_currentActivityViewController;

// 打开App的系统设置面板
- (void)yaco_openSettingPage;

// 拨打电话
- (void)yaco_telTo:(NSString *)phoneNumber;

// 注册推送通知
- (void)yaco_registerNotificationSettings;

// 是否开启推送通知
- (BOOL)yaco_allowedNotification;

// 打开系统推送通知设置页面
- (void)yaco_openNotificationSettings;

// 打开app在appStore的主页面
- (void)yaco_openAppStoreWithAppId:(NSString *)appId;

// 打开app在appStore的评价页面
- (void)yaco_openAppStoreReviewsWithAppId:(NSString *)appId;


@end

NS_ASSUME_NONNULL_END
