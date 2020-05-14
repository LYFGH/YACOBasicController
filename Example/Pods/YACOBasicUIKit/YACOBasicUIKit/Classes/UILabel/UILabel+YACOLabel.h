//
//  UILabel+YACOLabel.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YACOLabel)
/// 返回对应alignment的label 默认label使用autoLayout
/// @param alignment NSTextAlignment类型
+ (instancetype)yaco_labelWithTextAlignment:(NSTextAlignment)alignment;


/// 快速实例化一个UILabel
/// @param font 字体大小
/// @param bColor 背景色
/// @param tColor 字体颜色
/// @param alignment 文本排列
/// @param isWarp 是否换行
+ (instancetype)yaco_labelWithFont:(UIFont *)font
                  backGroundColor:(UIColor *)bColor
                        textColor:(UIColor *)tColor
                    textAlignment:(NSTextAlignment)alignment
                           isWarp:(BOOL)isWarp;


/// 修改Label行间距
/// @param label Label
/// @param lineSpace 行间距
+ (void)yaco_changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace;

/// 修改Label字间距
/// @param label Label
/// @param wordSpace 字间距
+ (void)yaco_changeWordSpaceForLabel:(UILabel *)label wordSpace:(float)wordSpace;

/// 修改Label行间距和字间距
/// @param label Label
/// @param lineSpace 行间距
/// @param wordSpace 字间距
+ (void)yaco_changeSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace wordSpace:(float)wordSpace;
@end

NS_ASSUME_NONNULL_END
