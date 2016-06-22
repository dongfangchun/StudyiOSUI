//
//  XXSegmentViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/12.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "XXSegmentViewController.h"
#import "XXSegmentView.h"

@interface XXSegmentViewController ()

@property (nonatomic, strong) XXSegmentView *xxSegmentHeader;

@end

@implementation XXSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //XXSegmentView
    XXSegmentView *seg = [[XXSegmentView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40)];
    [seg setTitles:@[@"上海",@"北京",@"广州",@"武汉",@"南京",@"天津",@"杭州",@"苏州",@"无锡",@"嘉兴",@"荆门"]];
    [self.view addSubview:seg];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    });
    
    //ScroolView
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (XXSegmentView *)xxSegmentHeader{
    if(!_xxSegmentHeader){
        
    }
    return _xxSegmentHeader;
}

@end
