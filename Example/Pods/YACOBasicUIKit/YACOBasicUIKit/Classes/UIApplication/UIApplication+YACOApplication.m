//
//  UIApplication+YACOApplication.m
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import "UIApplication+YACOApplication.h"

@implementation UIApplication (YACOApplication)
- (UIViewController *)yaco_currentActivityViewController
{
    UIViewController *activityViewController = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows) {
            if(tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0) {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        
        if([nextResponder isKindOfClass:[UIViewController class]]) {
            activityViewController = nextResponder;
        } else {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
}

- (void)yaco_openSettingPage
{
    [self openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

- (void)yaco_telTo:(NSString *)phoneNumber
{
    phoneNumber = [phoneNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *str = [NSString stringWithFormat:@"telprompt://%@", phoneNumber];
    [self openURL:[NSURL URLWithString:str]];
}

- (void)yaco_registerNotificationSettings
{
    UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                            settingsForTypes:(UIUserNotificationTypeAlert |
                                                              UIUserNotificationTypeBadge |
                                                              UIUserNotificationTypeSound)
                                            categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (BOOL)yaco_allowedNotification
{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone != setting.types) {
        return YES;
    }

    return NO;
}

- (void)yaco_openNotificationSettings
{
    NSString *url = nil;
    
//    if (@available(iOS 10.0, *)) {
        url = UIApplicationOpenSettingsURLString;
//    } else {
//        url = @"prefs:root=---.SSA";
//    }
    
    if ([self canOpenURL:[NSURL URLWithString:url]]) {
        if (@available(iOS 10.0, *)) {
            [self openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
        } else {
            [self openURL:[NSURL URLWithString:url]];
        }
    }
}

- (void)yaco_openAppStoreWithAppId:(NSString *)appId
{
    NSString *appStoreString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", appId];
    [self openURL:[NSURL URLWithString:appStoreString]];
}

- (void)yaco_openAppStoreReviewsWithAppId:(NSString *)appId
{
    NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", appId];
    [self openURL:[NSURL URLWithString:str]];
}
@end
