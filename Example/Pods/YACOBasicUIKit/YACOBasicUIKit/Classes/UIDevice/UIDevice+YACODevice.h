//
//  UIDevice+YACODevice.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//


#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, YACONetworkType) {

    YACONetworkTypeUnReachable,
    YACONetworkTypeWifi,
    YACONetworkTypeOther,
    YACONetworkType2G,
    YACONetworkType3G,
    YACONetworkType4G
};


NS_ASSUME_NONNULL_BEGIN
@interface UIDevice (YACODevice)
// 获取手机网络类型
- (YACONetworkType)yaco_networkType;

// 手机型号
- (NSString *)yaco_phoneType;

// 运营商
- (NSString *)yaco_OperatorInfo;

// 获取idfa
- (NSString *)yaco_idfaString;

// 获取idfv
- (NSString *)yaco_idfvString;

// mac地址
- (NSString *)yaco_macAddress;
@end

NS_ASSUME_NONNULL_END
