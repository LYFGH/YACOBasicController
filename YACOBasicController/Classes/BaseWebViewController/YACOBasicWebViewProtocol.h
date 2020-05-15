//
//  YACOBasicWebViewProtocol.h
//  YACOBasicUIKit
//
//  Created by 李亚飞 on 2020/5/15.
//

#ifndef YACOBasicWebViewProtocol_h
#define YACOBasicWebViewProtocol_h
@protocol YACOBasicWebViewProtocol <NSObject>

@optional
// 加载关闭按钮  如需自定义样式，重写
- (void)yaco_loadCloseBarItem;

// 开始webView 请求
- (void)yaco_startWebViewLoading;

// 下拉刷新触发的方法
- (void)yaco_pullDownToRefreshAction;


@required
// 注册需要和H5交互的方法
- (void)yaco_registerJSMethods;

@end

#endif /* YACOBasicWebViewProtocol_h */
