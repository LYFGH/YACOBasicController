//
//  UIView+YACOFrame.m
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import "UIView+YACOFrame.h"

@implementation UIView (YACOFrame)

#pragma mark 尺寸
- (void)setYaco_x:(CGFloat)yaco_x
{
    CGRect frame = self.frame;
    frame.origin.x = yaco_x;
    
    self.frame = frame;
}

- (CGFloat)yaco_x
{
    return self.frame.origin.x;
}




- (void)setYaco_y:(CGFloat)yaco_y
{
    CGRect frame = self.frame;
    frame.origin.y = yaco_y;
    
    self.frame = frame;
}
- (CGFloat)yaco_y
{
    return self.frame.origin.y;
}


- (void)setYaco_width:(CGFloat)yaco_width
{
    CGRect frame = self.frame;
    frame.size.width = yaco_width;
    
    self.frame = frame;
}
-(CGFloat)yaco_width
{
    return self.frame.size.width;
}



- (void)setYaco_height:(CGFloat)yaco_height
{
    CGRect frame = self.frame;
    frame.size.height = yaco_height;
    
    self.frame = frame;
}

- (CGFloat)yaco_height
{
    return self.frame.size.height;
}



- (void)setYaco_centerX:(CGFloat)yaco_centerX
{
    CGPoint newCenter = self.center;
    newCenter.x = yaco_centerX;
    self.center = newCenter;
}

- (CGFloat)yaco_centerX
{
    return self.center.x;
}

- (void)setYaco_centerY:(CGFloat)yaco_centerY
{
    CGPoint newCenter = self.center;
    newCenter.y = yaco_centerY;
    self.center = newCenter;
}

- (CGFloat)yaco_centerY
{
    return self.center.y;
}

- (void)setYaco_top:(CGFloat)yaco_top
{
    self.frame = CGRectMake(self.yaco_left, yaco_top, self.yaco_width, self.yaco_height);
}

- (CGFloat)yaco_top
{
    return self.frame.origin.y;
}

- (void)setYaco_bottom:(CGFloat)yaco_bottom
{
    self.frame = CGRectMake(self.yaco_left, yaco_bottom - self.yaco_height, self.yaco_width, self.yaco_height);
}

- (CGFloat)yaco_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}



- (void)setYaco_left:(CGFloat)yaco_left
{
    self.frame = CGRectMake(yaco_left, self.yaco_top, self.yaco_width, self.yaco_height);
}

- (CGFloat)yaco_left
{
    return self.frame.origin.x;
}


- (void)setYaco_right:(CGFloat)yaco_right
{
    self.frame = CGRectMake(yaco_right - self.yaco_width, self.yaco_top, self.yaco_width, self.yaco_height);
}

- (CGFloat)yaco_right
{
    return self.frame.origin.x + self.frame.size.width;
}


/// 设置圆角 corners指定哪几个角圆角
/// @param cornerRadii 圆角尺寸
/// @param corners 哪个角
- (void)yaco_setCornerRadii:(CGSize)cornerRadii forRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


-(void)yaco_setGradientBackgroundColorWithStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor StartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint
{
    //  创建 CAGradientLayer 对象
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //  设置 gradientLayer 的 Frame
    gradientLayer.frame = self.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(id)startColor.CGColor,
                             (id)endColor.CGColor];
    //  设置三种颜色变化点，取值范围 0.0~1.0
    //        gradientLayer.locations = @[@(0.1f) ,@(0.4f)];
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(startPoint.x, startPoint.y);
    gradientLayer.endPoint = CGPointMake(endPoint.x,endPoint.y);
    //  添加渐变色到创建的 UIView 上去
    [self.layer addSublayer:gradientLayer];
}



@end
