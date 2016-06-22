//
//  GifViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/13.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "GifViewController.h"

#import "YYKit.h"

@interface GifViewController ()

@end

@implementation GifViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [YYImage imageNamed:@"niconiconi.gif"];
    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:imageView];

    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 230, 200, 200)];
    [self.view addSubview:imageView2];

    [imageView2 setImageWithURL:[NSURL URLWithString:@"https://s-media-cache-ak0.pinimg.com/1200x/2e/0c/c5/2e0cc5d86e7b7cd42af225c29f21c37f.jpg"]
                    placeholder:nil
                        options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity | YYWebImageOptionSetImageWithFadeAnimation progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
                            
    } transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
