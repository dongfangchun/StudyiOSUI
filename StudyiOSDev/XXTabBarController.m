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

#define MENU_WIDTH (ScreenWidth * 2 / 3)
#define SLIDE_VELOCITY 200.f

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
    
//    [self menuView];
    //滑动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    
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
            CGRect menuFrame = CGRectMake(self.menuView.frame.origin.x + delta_X, self.menuView.frame.origin.y, self.menuView.frame.size.width, self.menuView.frame.size.height);

            if(frame.origin.x > MENU_WIDTH || frame.origin.x < CGFLOAT_MIN){
                return;
            }
            [self.view setFrame:frame];
            [self.menuView setFrame:menuFrame];
        }
        self.panLocationLast = self.panLocationCurrent;
    }
    else if(panSender.state == UIGestureRecognizerStateEnded){
        
        CGRect frame = self.view.frame;
        CGRect menuFrame = self.menuView.frame;

        if(self.panStatus == 0){
            if(vel.x > SLIDE_VELOCITY || self.view.frame.origin.x > MENU_WIDTH / 2){
                frame.origin.x = ScreenWidth * 2 / 3;
                menuFrame.origin.x = 0;
                self.panStatus = 1;
            }
            else{
                frame.origin.x = 0;
                menuFrame.origin.x = -MENU_WIDTH;
            }
        }
        else{
            if(vel.x < -SLIDE_VELOCITY || self.view.frame.origin.x < MENU_WIDTH / 2){
                frame.origin.x = 0;
                menuFrame.origin.x = -MENU_WIDTH;
                self.panStatus = 0;
            }
            else{
                frame.origin.x = MENU_WIDTH;
                menuFrame.origin.x = 0;
            }
        }

        [UIView animateWithDuration:0.1f animations:^{
            self.view.frame = frame;
            self.menuView.frame = menuFrame;
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
        self.menuView.frame = CGRectMake(-MENU_WIDTH, 0, MENU_WIDTH,ScreenHeight);
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

- (UIView *)createMenuView{
    if(!_menuView){
        _menuView = [[UIView alloc]initWithFrame:CGRectMake(-MENU_WIDTH, 0,MENU_WIDTH,ScreenHeight)];
        [_menuView setBackgroundColor:[UIColor grayColor]];
        
        UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(1, 50, MENU_WIDTH - 2, 40)];
        [btn1 setBackgroundColor:[UIColor blueColor]];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setTitle:@"Button1" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(ClickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [_menuView addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(1, 92, MENU_WIDTH - 2, 40)];
        [btn2 setBackgroundColor:[UIColor blueColor]];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitle:@"Button2" forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(ClickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [_menuView addSubview:btn2];
        
        UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(1, 134, MENU_WIDTH - 2, 40)];
        [btn3 setBackgroundColor:[UIColor blueColor]];
        [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn3 setTitle:@"Button3" forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(ClickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [_menuView addSubview:btn3];
        
        
        
        [self.keyWindow addSubview:_menuView];
    }
    return _menuView;
}

- (void)ClickMenuButton:(id)sender{
    NSLog(@"Click %@",sender);
}

@end


