//
//  YACOWebProgressView.h
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YACOWebProgressView : UIView
// 开始加载
- (void)yaco_startLoadingAnimation;

// 结束加载
- (void)yaco_endLoadingAnimation;
@end

NS_ASSUME_NONNULL_END
