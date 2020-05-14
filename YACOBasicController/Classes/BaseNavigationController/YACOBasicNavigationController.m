//
//  YACOBasicNavigationController.m
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "YACOBasicNavigationController.h"

@interface YACOBasicNavigationController ()

@end

@implementation YACOBasicNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
