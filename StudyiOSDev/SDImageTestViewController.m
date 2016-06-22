//
//  SDImageTestViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/14.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "SDImageTestViewController.h"
#import "UIImageView+WebCache.h"

@interface SDImageTestViewController ()

@end

@implementation SDImageTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView.layer setBorderWidth:1.0f];
    [imageView.layer setBorderColor:[[UIColor redColor]CGColor]];
    [self.view addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://publicschool-pic.stor.sinaapp.com/temp/Add_By_Edit.png"]
                 placeholderImage:[UIImage imageNamed:@"niconiconi.gif"]
                          options:SDWebImageRefreshCached];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
