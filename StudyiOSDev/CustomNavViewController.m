//
//  MyNavViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/8.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "MyNavViewController.h"
#import "ViewController.h"

@interface MyNavViewController ()

@end

@implementation MyNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"back"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


@end
