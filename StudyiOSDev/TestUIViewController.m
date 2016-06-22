//
//  TestUIViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/16.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "TestUIViewController.h"

@interface TestUIViewController ()

@end

@implementation TestUIViewController

__weak NSObject *string_weak_ = nil;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSObject *string =  [[NSString  alloc]initWithFormat: @"leetcoode %d",333];
    
    string_weak_ = string;
    
    NSLog(@"Load : %@",string_weak_);
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Will String : %@",string_weak_);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"WillDid String : %@",string_weak_);
}

+ (NSObject *)myAlloc{
    NSObject *o =  [[NSObject alloc]init];
    return o;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
