//
//  TTTLabelViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/8.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "TTTLabelViewController.h"
#import "TTTAttributedLabel.h"
#import "UIView+Toast.h"

@interface TTTLabelViewController ()<TTTAttributedLabelDelegate>

@end

@implementation TTTLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TTTAttributedLabel *label = [[TTTAttributedLabel alloc]init];
    label.frame = CGRectMake(30, 100, 200, 40);
    label.attributedText = [[NSAttributedString alloc]initWithString:@"1234567890"];
    label.delegate = self;
    
    [label addLinkToURL:[[NSURL alloc]initWithString:@"http://www.baidu.com"] withRange:NSMakeRange(0, 2)];
    [label addLinkToURL:[[NSURL alloc]initWithString:@"http://www.sina.com"] withRange:NSMakeRange(5, 5)];
    
    [self.view addSubview:label];
    
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url{
    [self.view makeToast:url.absoluteString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
