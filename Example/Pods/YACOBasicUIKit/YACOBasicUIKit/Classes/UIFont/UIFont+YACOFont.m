//
//  UIFont+YACOFont.m
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import "UIFont+YACOFont.h"

@implementation UIFont (YACOFont)

+ (UIFont *)yaco_thinFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
}

+ (UIFont *)yaco_normalFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)yaco_boldFontOfSize:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:fontSize];
}

+ (UIFont *)yaco_PingFangSCMediumOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
}

+ (UIFont *)yaco_PingFangSCRegularOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}
@end
