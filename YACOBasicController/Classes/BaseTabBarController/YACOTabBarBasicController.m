//
//  YACOTabBarBasicController.m
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "YACOTabBarBasicController.h"

@interface YACOTabBarBasicController ()

@end

@implementation YACOTabBarBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

///例子

//-(void)addSubViewControllers{
//
//    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    [self addTabBarWithController:homeVC withName:@"首页" withImageName:@"btn_home_normal" withSelectedImageName:@"btn_home_selected"];
//
//
//
//
//    UserViewController *userVC = [[UserViewController alloc] init];
//    [self addTabBarWithController:userVC withName:@"我的" withImageName:@"btn_user_normal" withSelectedImageName:@"btn_user_selected"];
//
//
//}
//
//
//-(void)addTabBarWithController:(UIViewController *)viewCon withName:(NSString *)name withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName
//{
//    viewCon.title = name;
//    // 设置控制器的图片
//    viewCon.tabBarItem.image = [UIImage imageNamed:imageName];
//    viewCon.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    // 包装控制器
//    YFBaseNavigationController * viewConNav = [[YFBaseNavigationController alloc]initWithRootViewController:viewCon];
//
//    [self addChildViewController:viewConNav];
//}

@end
