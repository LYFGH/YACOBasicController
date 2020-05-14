//
//  UIView+YACOFrame.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YACOFrame)

// x y
@property (nonatomic, assign) CGFloat yaco_x;
@property (nonatomic, assign) CGFloat yaco_y;

// width height
@property (nonatomic, assign) CGFloat yaco_width;
@property (nonatomic, assign) CGFloat yaco_height;

// center
@property (nonatomic, assign) CGFloat yaco_centerX;
@property (nonatomic, assign) CGFloat yaco_centerY;

// margin
@property (nonatomic, assign) CGFloat yaco_top;
@property (nonatomic, assign) CGFloat yaco_bottom;
@property (nonatomic, assign) CGFloat yaco_left;
@property (nonatomic, assign) CGFloat yaco_right;





/// 设置圆角 corners指定哪几个角圆角
/// @param cornerRadii 圆角尺寸
/// @param corners 哪个角
- (void)yaco_setCornerRadii:(CGSize)cornerRadii forRoundingCorners:(UIRectCorner)corners;




/// 设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
/// @param startColor 开始颜色
/// @param endColor 结束颜色
/// @param startPoint 开始点
/// @param endPoint 结束点
-(void)yaco_setGradientBackgroundColorWithStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor StartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint;




@end

NS_ASSUME_NONNULL_END
