//
//  UIFont+YACOFont.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (YACOFont)
// 细体
+ (UIFont *)yaco_thinFontOfSize:(CGFloat)fontSize;

// 正常
+ (UIFont *)yaco_normalFontOfSize:(CGFloat)fontSize;

// 粗体
+ (UIFont *)yaco_boldFontOfSize:(CGFloat)fontSize;

// PingFangSC-Medium
+ (UIFont *)yaco_PingFangSCMediumOfSize:(CGFloat)fontSize;

// PingFangSC-Regular
+ (UIFont *)yaco_PingFangSCRegularOfSize:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
