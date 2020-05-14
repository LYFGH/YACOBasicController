//
//  UIColor+YACOColor.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YACOColor)
/// 根据key来获取颜色 (alpha 默认为 1)
/// @param key 16进制字符串
+ (UIColor *)yaco_colorForKey:(NSString *)key;



/// 根据key 与 alpha 来获取颜色
/// @param key 16进制字符串
/// @param alpha alpha值
+ (UIColor *)yaco_colorForKey:(NSString *)key alpha:(CGFloat)alpha;


/// UIColor 转 UIImage
/// @param color 颜色
+ (UIImage *)yaco_imageWithColor:(UIColor *)color;


/// 随机颜色
+ (UIColor *)yaco_randomColor;
@end

NS_ASSUME_NONNULL_END
