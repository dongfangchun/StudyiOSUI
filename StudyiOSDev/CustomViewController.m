//
//  CustomViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/8.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "CustomViewController.h"
#import "MyTableViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad{
    [super viewDidLoad];
#ifdef __IPHONE_7_0
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
#endif
}

-(void)pushViewController:(CustomViewController *)vc animated:(BOOL)animated{
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
