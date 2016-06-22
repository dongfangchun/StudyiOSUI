//
//  MyNavViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/8.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "CustomNavViewController.h"
#import "CustomViewController.h"

@interface CustomNavViewController ()

@end

@implementation CustomNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef __IPHONE_7_0
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"back"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 控制转屏（在TabBarController里面，这里无法控制。如果脱离TabBarController，就依靠这里控制了）
- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


@end
