//
//  UILabel+YACOLabel.m
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import "UILabel+YACOLabel.h"


@implementation UILabel (YACOLabel)
/// 返回对应alignment的label 默认label使用autoLayout
/// @param alignment NSTextAlignment类型
+ (instancetype)yaco_labelWithTextAlignment:(NSTextAlignment)alignment
{
    UILabel *label = [[self alloc] initForAutoLayout];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = alignment;
    
    return label;
}

- (instancetype)initForAutoLayout
{
    self = [self init];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

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
                           isWarp:(BOOL)isWarp
{
    UILabel *label = [self yaco_labelWithTextAlignment:alignment];
    label.font = font;
    label.backgroundColor = bColor;
    label.textColor = tColor;
    label.numberOfLines = isWarp ? 0 : 1;
    [label sizeToFit];
    return label;
}

#pragma mark  ------------改变行间距和字间距-------

+ (void)yaco_changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace{
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)yaco_changeWordSpaceForLabel:(UILabel *)label wordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)yaco_changeSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace wordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
@end
