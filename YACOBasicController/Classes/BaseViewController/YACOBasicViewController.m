//
//  YACOBasicViewController.m
//  YACOBasicController
//
//  Created by 李亚飞 on 2020/5/14.
//

#import "YACOBasicViewController.h"

@interface YACOBasicViewController ()
@property (nonatomic, strong) NSMutableArray *models;

@property (nonatomic, assign) BOOL isDefaultBackBtn;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) NSLayoutConstraint *activityViewConstraint;

@end

@implementation YACOBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11, *)) {
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeAll;
}

// 通用式返回操作
- (void)yaco_backToLastViewController
{
    if (self.navigationController && self.navigationController.viewControllers.count > 0 && self.navigationController.viewControllers.firstObject != self.navigationController.topViewController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (self.navigationController) {
        [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/// 返回相应的Controller
/// @param controllerName Controller名字
/// @param animaed 是否动画
-(void)yaco_backToController:(NSString *)controllerName animated:(BOOL)animaed{
    
    if(self.navigationController.viewControllers.count <= 1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        if (self.navigationController) {
            NSArray *controllers = self.navigationController.viewControllers;
            NSArray *result = [controllers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
                return [evaluatedObject isKindOfClass:NSClassFromString(controllerName)];
            }]];
            if (result.count > 0) {
                [self.navigationController popToViewController:result[0] animated:YES];
            }
        }
    }
}

@end


@implementation YACOBasicViewController (NavigationBar)

- (void)yaco_setNavBarTitle:(NSString *)title textColor:(UIColor *)textColor fontSize:(CGFloat)font
{
    if (title == nil || [title length] == 0 || [title isEqualToString:@""]) {
        self.navigationItem.titleView = nil;
    } else {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = textColor;
        titleLabel.font = [UIFont systemFontOfSize:font];
        titleLabel.text = title;
        [titleLabel sizeToFit];
        
        self.navigationItem.titleView = titleLabel;
    }
}

- (void)yaco_setNavBarTitle:(UIImage *)titleImage
{
    if (titleImage) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, titleImage.size.width, titleImage.size.height)];
        imageView.image = titleImage;
        
        self.navigationItem.titleView = imageView;
    } else {
        self.navigationItem.titleView = nil;
    }
}

- (void)yaco_setNavBarLeftItem:(NSString *)title textColor:(UIColor *)textColor
{
    if (title == nil || [title length] == 0 || [title isEqualToString:@""]) {
        return;
    }
    
    self.isDefaultBackBtn = NO;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 20);
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton setTitleColor:textColor forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [leftButton addTarget:self action:@selector(yaco_onPressedLeftBarItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)yaco_setNavBarRightItem:(NSString *)title textColor:(UIColor *)textColor
{
    if (title == nil || [title length] == 0 || [title isEqualToString:@""]) {
        return;
    }
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 60, 20);
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:textColor forState:UIControlStateNormal];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize: 15]];
    [rightButton addTarget:self action:@selector(yaco_onPressedRightBarItem:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton sizeToFit];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)yaco_setNavBarLeftItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage
{
    self.isDefaultBackBtn = NO;
    
    CGSize buttonSize = CGSizeMake(24.f, 24.f);
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
    [leftButton setImage:normalImage forState:UIControlStateNormal];
    [leftButton setImage:hightedImage forState:UIControlStateHighlighted];
    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftButton addTarget:self action:@selector(yaco_onPressedLeftBarItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)yaco_setNavBarRightItem:(UIImage *)normalImage hightedImage:(UIImage *)hightedImage
{
    CGSize buttonSize = CGSizeMake(24.f, 24.f);
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
    [rightButton setImage:normalImage forState:UIControlStateNormal];
    [rightButton setImage:hightedImage forState:UIControlStateHighlighted];
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightButton addTarget:self action:@selector(yaco_onPressedRightBarItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)yaco_setNavBarRightItem:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
{
    CGSize buttonSize = CGSizeMake(24.f, 24.f);
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
    [rightButton setImage:normalImage forState:UIControlStateNormal];
    [rightButton setImage:selectedImage forState:UIControlStateSelected];
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightButton addTarget:self action:@selector(yaco_onPressedRightBarItem:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)yaco_setDefaultBackBarItem
{
    self.isDefaultBackBtn = YES;
   
}

- (void)yaco_onPressedBackBarButton
{
    [self yaco_backToLastViewController];
}

- (void)yaco_onPressedLeftBarItem
{}

- (void)yaco_onPressedRightBarItem:(UIButton *)sender
{}

@end


@implementation YACOBasicViewController (Loading)

- (BOOL)yaco_isPageLoading
{
    return self.activityIndicatorView.isAnimating;
}

- (void)yaco_showCommonLoading
{
    [self yaco_showCommonLoading:YACOViewControllerLoadingTypeNormal];
}

- (void)yaco_showCommonLoading:(YACOViewControllerLoadingType)loadingType {
    [self yaco_showCommonLoading:loadingType offsetY:0];
}

- (void)yaco_showCommonLoading:(YACOViewControllerLoadingType)loadingType offsetY:(CGFloat)offsetY
{
    [self.view bringSubviewToFront:self.activityIndicatorView];
    self.activityViewConstraint.constant = offsetY;
    [self.activityIndicatorView startAnimating];
    
    switch (loadingType) {
        case YACOViewControllerLoadingTypeFullScreen:
            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            break;
        case YACOViewControllerLoadingTypeView:
            self.view.userInteractionEnabled = NO;
            break;
        default:
            break;
    }
}

- (void)yaco_dismissLoading
{
    
    [self.view sendSubviewToBack:self.activityIndicatorView];
    [self.activityIndicatorView stopAnimating];
    self.view.userInteractionEnabled = YES;
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    
}

@end
