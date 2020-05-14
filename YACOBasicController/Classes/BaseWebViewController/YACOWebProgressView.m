//
//  YACOWebProgressView.m
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "YACOWebProgressView.h"
#import "UIView+YACOFrame.h"


@implementation YACOWebProgressView

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
        weakSelf.yaco_width = [UIScreen mainScreen].bounds.size.width * 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.yaco_width = [UIScreen mainScreen].bounds.size.width * 0.8;
        }];
    }];
}

- (void)yaco_endLoadingAnimation
{
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.yaco_width = [UIScreen mainScreen].bounds.size.width;
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}


@end
