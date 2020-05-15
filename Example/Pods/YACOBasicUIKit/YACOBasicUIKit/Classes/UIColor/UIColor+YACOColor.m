//
//  UIColor+YACOColor.m
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import "UIColor+YACOColor.h"


@implementation UIColor (YACOColor)
+ (UIColor *)yaco_colorForKey:(NSString *)key
{
    return [self yaco_colorForKey:key alpha:1.0f];
}

+ (UIColor *)yaco_colorForKey:(NSString *)key alpha:(CGFloat)alpha
{
    return [UIColor yaco_colourWithHexString:key alpha:alpha];
}

+ (UIImage *)yaco_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIColor *)yaco_randomColor
{
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

#pragma mark - Others
+ (UIColor *)yaco_colourWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)yaco_colourWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha
{
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    
    return [UIColor yaco_colourWithRGBHex:hexNum alpha:alpha];
}

@end
