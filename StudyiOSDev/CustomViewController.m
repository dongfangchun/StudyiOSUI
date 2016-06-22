//
//  ViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/8.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

/**
 *  pushViewController的封装
 *
 *  @param viewController 被push的ViewController
 *  @param animated       动画
 */
-(void)pushViewController:(ViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
