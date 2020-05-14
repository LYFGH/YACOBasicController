//
//  YACOBasicWKWebController.m
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "YACOBasicWKWebController.h"
#import "YACOWebProgressView.h"
#import "MJRefreshNormalHeader.h"
@interface YACOBasicWKWebController ()<WKUIDelegate, WKNavigationDelegate>
// 进度条
@property (nonatomic, strong) UIProgressView *progressView;

@property (nonatomic, strong) WKWebViewConfiguration *configuration;
// 关闭按钮
@property (nonatomic, strong) UIBarButtonItem *closeBarItem;


// 第一次进入时的标题
@property (nonatomic, copy) NSString *initialTitle;

@end

@implementation YACOBasicWKWebController

+ (instancetype)pushWebViewController:(UINavigationController *)navigationController url:(NSString *)url title:(NSString *)title
{
    YACOBasicWKWebController *baseWebVC = nil;
    if (navigationController && [self isSubclassOfClass:[YACOBasicWKWebController class]]) {
        baseWebVC = [[[self class] alloc] init];
        baseWebVC.urlString = url;
        baseWebVC.initialTitle = title;
        
        [navigationController pushViewController:baseWebVC animated:YES];
    }
    
    return baseWebVC;
}

#pragma mark - Life Circle
- (void)dealloc
{
    [_myWebView stopLoading];
    
    [_myWebView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
    [_myWebView removeObserver:self forKeyPath:@"title" context:nil];
    
    _myWebView.scrollView.delegate = nil;
    _myWebView = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupWebView];
    
    [self yaco_registerJSMethods];
    
    [self yaco_startWebViewLoading];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark - Common Setup
- (void)setupWebView
{
    [self.view addSubview:self.myWebView];
    [self.view addSubview:self.progressView];
    
    [self setupKVO];
    
    self.webViewDelegate = self;
}

- (void)setupKVO
{
    // 添加KVO
    // estimatedProgress，监听当前网页加载的进度
    [self.myWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    // 网页标题
    [self.myWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)onPressedBackBarButton
{
    if ([self.myWebView canGoBack]) {
        [self.myWebView goBack];
    } else {
        [self yaco_backToLastViewController];
    }
}

#pragma mark - Property
- (WKWebView *)myWebView
{
    if (!_myWebView) {
        _myWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:self.configuration];
//        _myWebView.navigationDelegate = self;
        _myWebView.UIDelegate = self;
        _myWebView.allowsBackForwardNavigationGestures = YES;
    }
    
    return _myWebView;
}
- (WKWebViewConfiguration *)configuration
{
    if (!_configuration) {
        _configuration = [[WKWebViewConfiguration alloc] init];
        _configuration.preferences = [WKPreferences new];
        // The minimum font size in points default is 0;
        _configuration.preferences.minimumFontSize = 10;
        // 是否支持JavaScript
        _configuration.preferences.javaScriptEnabled = YES;
        // 不通过用户交互，是否可以打开窗口
        _configuration.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        _configuration.allowsInlineMediaPlayback = YES;
        if (@available(iOS 9.0, *)) {
            _configuration.allowsPictureInPictureMediaPlayback = YES;
        }
    }
    
    return _configuration;
}

- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0.f, [UIScreen mainScreen].bounds.size.width, 2.f)];
        _progressView.trackTintColor = [UIColor colorWithWhite:0 alpha:0.08];
        _progressView.tintColor = self.customProgressColor ? : [UIColor blueColor];
        _progressView.transform = CGAffineTransformMakeScale(1.f, 1.5f);
    }
    
    return _progressView;
}

- (void)setNeedPullDownRefresh:(BOOL)needPullDownRefresh
{
    _needPullDownRefresh = needPullDownRefresh;
    if (_needPullDownRefresh) {
        if (!_refreshHeader) {
            self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(yaco_pullDownToRefreshAction)];
        }
        
        self.myWebView.scrollView.mj_header = self.refreshHeader;
    } else {
        [self.myWebView.scrollView.mj_header removeFromSuperview];
    }
}

- (void)setCustomProgressColor:(UIColor *)customProgressColor {
    _customProgressColor = customProgressColor;
    _progressView.tintColor = customProgressColor;
}

#pragma mark - Method
- (void)cleanWKWebViewCookies
{
    if (@available(iOS 9.0, *)) {
        NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
        // Date from
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        // Execute
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        }];
    } else {
        // iOS8清除缓存
        NSString *libraryPath =  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:nil];
    }
}

#pragma mark - WKNavigationDelegate & WKUIDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    // 开始加载网页
    self.progressView.hidden = NO;
    self.progressView.transform = CGAffineTransformMakeScale(1.f, 1.5f);
    [self.view bringSubviewToFront:self.progressView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    // 加载完成
    self.progressView.hidden = YES;
    [self.refreshHeader endRefreshing];
    
    // 层级>1时，展示关闭按钮
    [self _showCloseBarItem];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    // 加载失败
    self.progressView.hidden = YES;
    [self.refreshHeader endRefreshing];
    
    // 层级>1时，展示关闭按钮
    [self _showCloseBarItem];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL *url = navigationAction.request.URL;
    
    // 跳转AppStore
    if ([url.absoluteString containsString:@"itunes.apple.com"] || [url.absoluteString containsString:@"a.app.qq.com"]) {
        UIApplication *app = [UIApplication sharedApplication];
        if ([app canOpenURL:url]) {
            [app openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    
    // 如果是跳转一个新页面 a链接
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    // 允许页面跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - YACOBaseWebViewProtocol
- (void)yaco_loadCloseBarItem
{
    // 子类如没重写，则默认以下代码
    UIButton *item = [[UIButton alloc] init];
    [item setTitle:@"关闭" forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(yaco_backToLastViewController) forControlEvents:UIControlEventTouchUpInside];
    
    _closeBarItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    
    [self.navigationItem setLeftBarButtonItems:@[self.navigationItem.leftBarButtonItem, _closeBarItem]];
}

- (void)yaco_registerJSMethods
{
    [self _setupWebViewBridge];
    
    // 交给子类处理
    
}

- (void)yaco_startWebViewLoading
{
    // 子类如没重写，则默认以下代码
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    request.timeoutInterval = 15.f;
    
    [self.myWebView loadRequest:request];
}

- (void)yaco_pullDownToRefreshAction
{
    // 交给子类处理
}

#pragma mark - Observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"title"]) {
        self.title = [self.myWebView canGoBack] ? self.myWebView.title : (self.initialTitle.length ? self.initialTitle : self.myWebView.title);
    } else if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.myWebView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
            }];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Others
- (void)_showCloseBarItem
{
    // 层级>1时，展示关闭按钮
    if ([self.myWebView canGoBack] && self.myWebView.backForwardList.backItem) {
        [self yaco_loadCloseBarItem];
    } else {
        self.navigationItem.leftBarButtonItems = nil;
        [self yaco_setDefaultBackBarItem];
    }
}

- (void)_setupWebViewBridge
{
    [WKWebViewJavascriptBridge enableLogging];
    self.webViewBridge = [WKWebViewJavascriptBridge bridgeForWebView:self.myWebView];
    [self.webViewBridge setWebViewDelegate:self];
}




@end
