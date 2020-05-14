//
//  YACOBasicViewController.h
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YACOViewControllerLoadingType) {
    YACOViewControllerLoadingTypeNormal,     // 正常
    YACOViewControllerLoadingTypeFullScreen, // 全屏不能操作
    YACOViewControllerLoadingTypeView        // View不能操作
};


NS_ASSUME_NONNULL_BEGIN

@interface YACOBasicViewController : UIViewController
// 返回方法 通用
- (void)yaco_backToLastViewController;

/**
 *返回到指定类
 */
-(void)yaco_backToController:(NSString *)controllerName animated:(BOOL )animaed;


@end



@interface YACOBasicViewController (NavigationBar)

// 设置导航标题
- (void)yaco_setNavBarTitle:(NSString *)title textColor:(UIColor *)textColor fontSize:(CGFloat)font;

// 设置导航栏标题图片
- (void)yaco_setNavBarTitle:(UIImage *)titleImage;

// 根据文字设置左导航按钮
- (void)yaco_setNavBarLeftItem:(NSString *)title textColor:(UIColor *)textColor;

// 根据文字设置右导航按钮
- (void)yaco_setNavBarRightItem:(NSString *)title textColor:(UIColor *)textColor;

// 根据图片设置左导航按钮
- (void)yaco_setNavBarLeftItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage;

// 根据图片设置右导航按钮
- (void)yaco_setNavBarRightItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage;

// 根据选中图片设置右导航按钮
- (void)yaco_setNavBarRightItem:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

#pragma mark - Actions
// 默认的返回按钮
- (void)yaco_setDefaultBackBarItem;

// 返回按钮的回调
- (void)yaco_onPressedBackBarButton;

// 左边button回调
- (void)yaco_onPressedLeftBarItem;

// 右边button回调
- (void)yaco_onPressedRightBarItem:(UIButton *)sender;

@end



@interface YACOBasicViewController (Loading)

// 页面是否正在加载
@property (nonatomic, assign, readonly) BOOL yaco_isPageLoading;

// 显示页面加载
- (void)yaco_showCommonLoading;
- (void)yaco_showCommonLoading:(YACOViewControllerLoadingType)loadingType;
- (void)yaco_showCommonLoading:(YACOViewControllerLoadingType)loadingType offsetY:(CGFloat)offsetY;

// 页面加载完毕
- (void)yaco_dismissLoading;

@end

NS_ASSUME_NONNULL_END
