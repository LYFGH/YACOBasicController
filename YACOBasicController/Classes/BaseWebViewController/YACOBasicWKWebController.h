//
//  YACOBasicWKWebController.h
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/15.
//

#import "YACOBasicViewController.h"
#import <WebKit/WebKit.h>
#import <WebViewJavascriptBridge/WKWebViewJavascriptBridge.h>
#import <MJRefresh/MJRefreshHeader.h>
#import "YACOBasicWebViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface YACOBasicWKWebController : YACOBasicViewController <YACOBasicWebViewProtocol>
// title为空时，自动获取当前页面标题
+ (instancetype)pushWebViewController:(UINavigationController *)navigationController url:(NSString *)url title:(NSString *)title;

@property (nonatomic, strong) WKWebView *myWebView;

// web url
@property (nonatomic, copy) NSString *urlString;

// 导航栏进度条颜色
@property (nonatomic, strong) UIColor *customProgressColor;

@property (nonatomic, weak) id<YACOBasicWebViewProtocol> webViewDelegate;

@property (nonatomic, strong) WKWebViewJavascriptBridge *webViewBridge;

@property (nonatomic, strong) MJRefreshHeader *refreshHeader;

// 是否需要下拉刷新
@property (nonatomic, assign) BOOL needPullDownRefresh;

// 清楚WKWebView Cookies缓存
- (void)cleanWKWebViewCookies;



@end

NS_ASSUME_NONNULL_END
