//
//  XXTabBarController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/9.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "XXTabBarController.h"
#import "CustomNavViewController.h"
#import "CustomViewController.h"
#import "ViewControllerPage1.h"
#import "Header.h"

@interface XXTabBarController ()

@property(nonatomic, strong) CustomNavViewController *nav1;
@property(nonatomic, strong) CustomNavViewController *nav2;

@property(nonatomic, assign) CGPoint panLocationBegin;
@property(nonatomic, assign) CGPoint panLocationLast;
@property(nonatomic, assign) CGPoint panLocationCurrent;
@property(nonatomic, assign) CGPoint panLocationEnd;
@property(nonatomic, assign) NSInteger panStatus;//0 表示在左边正常情况  1表示在2/3出，slide的状态
@property(nonatomic, strong) UIButton *btnBackground;
@property(nonatomic, strong) UIView *menuView;
@end

@implementation XXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewControllers];
    self.selectedIndex = 0;
    
    [self menuView];
    //滑动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    

    //轻触
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                          action:@selector(handleTap1:)];
    tap1.numberOfTapsRequired = 1;
    [self.menuView addGestureRecognizer:tap1];
}

//Gesture
- (void)handleTap1:(UITapGestureRecognizer *)tapSender{
    NSLog(@"ddd");
}

-(void)handlePan:(UIPanGestureRecognizer *)panSender{
    __unused CGPoint loc = [panSender locationInView:panSender.view.superview];
    __unused CGPoint vel = [panSender velocityInView:panSender.view.superview];
    
    if(panSender.state == UIGestureRecognizerStateBegan){
        
        self.panLocationBegin = loc;
        self.panLocationCurrent = self.panLocationBegin;
        self.panLocationLast = self.panLocationCurrent;
    }
    else if(panSender.state == UIGestureRecognizerStateChanged){
        
        self.panLocationCurrent = loc;
        
        __unused CGFloat delta_X = self.panLocationCurrent.x - self.panLocationLast.x;
        __unused CGFloat delta_Y = self.panLocationCurrent.y - self.panLocationLast.y;

        if(fabs(delta_X) > fabs(delta_Y * 3)){
            CGRect frame = CGRectMake(self.view.frame.origin.x + delta_X, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);

            if(frame.origin.x > ScreenWidth * 2 / 3 || frame.origin.x < CGFLOAT_MIN){
                return;
            }
            [self.view setFrame:frame];
        }
        self.panLocationLast = self.panLocationCurrent;
    }
    else if(panSender.state == UIGestureRecognizerStateEnded){
        
        CGRect frame = self.view.frame;

        if(self.panStatus == 0){
            if(self.view.frame.origin.x < 10.0f){
                frame.origin.x = 0;
            }
            else{
                frame.origin.x = ScreenWidth * 2 / 3;
                self.panStatus = 1;
            }
        }
        else{
            if(self.view.frame.origin.x > ScreenWidth * 2 / 3 - 10.0f){
                frame.origin.x = ScreenWidth * 2 / 3;
            }
            else{
                frame.origin.x = 0;
                self.panStatus = 0;
            }
        }

        [UIView animateWithDuration:0.1f animations:^{
            self.view.frame = frame;
            if(self.panStatus){
                [self.viewBackground setHidden:NO];
            }
            else{
                [self.viewBackground setHidden:YES];
            }
        }];
    }
}


- (void)initViewControllers{
    
    ViewControllerPage1 *vc1 = [[ViewControllerPage1 alloc] init];
    self.nav1 = [self createController:vc1
                                 title:@"page1"
                             imageName:@"img"
                     selectedImageName:@"img2"];
    
    CustomViewController *vc2 = [[CustomViewController alloc] init];
    self.nav2 = [self createController:vc2
                                 title:@"page2"
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

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"33334534534");
}


#pragma mark - 转屏控制(注意：如果页面使用presentViewController弹出新窗口。那么横竖屏的控制就不在这里，而是在UINavigationController里控制了）
- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)ClickBackView:(id)sender{
    [UIView animateWithDuration:0.1f animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        self.menuView.frame = CGRectMake(-ScreenWidth * 2 / 3, 0, ScreenWidth * 2 / 3,ScreenHeight);
        [self.btnBackground setHidden:YES];
        self.panStatus = 0;
    }];
}

- (void)ClickMenu:(id)sender{
    NSLog(@"Click");
}


#pragma mark - lazy
- (UIView *)viewBackground{
    if(!_btnBackground){
        _btnBackground = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [_btnBackground setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.0]];
        [_btnBackground addTarget:self action:@selector(ClickBackView:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnBackground];
    }
    return _btnBackground;
}


- (UIView *)menuView{
    if(!_menuView){
        _menuView = [[UIView alloc]initWithFrame:CGRectMake(-ScreenWidth * 2 / 3, 0, ScreenWidth * 2 / 3,ScreenHeight)];
        [_menuView setBackgroundColor:[UIColor blueColor]];
        [self.view addSubview:_menuView];
    }
    return _menuView;
}

@end



