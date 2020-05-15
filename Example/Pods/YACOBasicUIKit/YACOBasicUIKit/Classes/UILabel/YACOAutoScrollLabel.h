//
//  YACOAutoScrollLabel.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, YACOAutoScrollDirectionType){
    YACOAutoScrollDirectionType_Right,       // 向右滚动
    YACOAutoScrollDirectionType_Left,        // 向左滚动
    YACOAutoScrollDirectionType_Top,         // 向上滚动
    YACOAutoScrollDirectionType_Bottom       // 向下滚动
};




@interface YACOAutoScrollLabel : UIView

/// 滚动方向
@property (nonatomic, assign) YACOAutoScrollDirectionType direction;
/// 滚动速度, 默认30
@property (nonatomic, assign) CGFloat scrollSpeed;
/// 自动滚动的时间间隔，默认1.5s
@property (nonatomic, assign) NSTimeInterval autoScrollInterval;
/// 滚动的label的间距，默认20
@property (nonatomic, assign) NSUInteger labelSpacing;
/// 是否滚动
@property (nonatomic, assign, readonly) BOOL scrolling;
/// text
@property (nonatomic, copy, nullable) NSString *text;
/// attributedText
@property (nonatomic, copy, nullable) NSAttributedString *attributedText;
///textColor
@property (nonatomic, strong, nonnull) UIColor *textColor;
///font
@property (nonatomic, strong, nonnull) UIFont *font;
/// shadowColor
@property (nonatomic, strong, nullable) UIColor *shadowColor;

/// shadowOffset
@property (nonatomic, assign) CGSize shadowOffset;

/// textAlignment
@property (nonatomic, assign) NSTextAlignment textAlignment;


/// 设置text和是否刷新label
/// @param text 文字
/// @param refresh 是否刷新
- (void)yaco_setText:(NSString * __nullable)text refreshLabels:(BOOL)refresh;

/// 设置AttributedText和是否刷新label
/// @param theText AttributedText
/// @param refresh 是否刷新
- (void)yaco_setAttributedText:(NSAttributedString * __nullable)theText refreshLabels:(BOOL)refresh;





@end

NS_ASSUME_NONNULL_END
