//
//  MyTabBarController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/9.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "MyTabBarController.h"
#import "CustomNavViewController.h"
#import "CustomViewController.h"
#import "ViewControllerPage1.h"

@interface MyTabBarController ()
@property(nonatomic,strong) CustomNavViewController *nav1;
@property(nonatomic,strong) CustomNavViewController *nav2;

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewControllers];
    
    self.selectedIndex = 0;
}


- (void)initViewControllers{
    
    ViewControllerPage1 *vc1 = [[ViewControllerPage1 alloc] init];
    self.nav1 = [self createController:vc1
                                 title:@"vc1"
                             imageName:@"img"
                     selectedImageName:@"img2"];
    
    CustomViewController *vc2 = [[CustomViewController alloc] init];
    self.nav2 = [self createController:vc2
                                 title:@"vc1"
                             imageName:@"img"
                     selectedImageName:@"img2"];
    
    self.viewControllers = @[self.nav1,self.nav2,];
}

- (CustomNavViewController *) createController:(UIViewController *) controller
                                     title:(NSString *)title
                                 imageName:(NSString *)imageName
                         selectedImageName:(NSString *)selectedImageName
{
    CustomNavViewController *nav = [[CustomNavViewController alloc] initWithRootViewController:controller];
    //nav.navigationBarHidden = YES;
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                   image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                           selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 转屏控制(注意：如果页面使用presentViewController弹出新窗口。那么横竖屏的控制就不在这里，而是在UINavigationController里控制了）
- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

@end
