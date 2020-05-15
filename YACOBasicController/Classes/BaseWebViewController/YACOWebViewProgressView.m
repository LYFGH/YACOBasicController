//
//  YACOWebViewProgressView.m
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOWebViewProgressView.h"
#import <YACOBasicUIKit/YACOBasicMacros.h>
#import <YACOBasicUIKit/YACOBasicUIKit.h>
@implementation YACOWebViewProgressView

- (instancetype)initWithFrame:(CGRect)frame withLineColor:(UIColor *)lineColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
    }
    
    return self;
}

- (void)yaco_startLoadingAnimation
{
    self.hidden = NO;
    self.yaco_width = 0.f;
    
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.yaco_width = kYACOScreenWidth * 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.yaco_width = kYACOScreenWidth * 0.8;
        }];
    }];
}

- (void)yaco_endLoadingAnimation
{
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.yaco_width = kYACOScreenWidth;
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}

@end
