//
//  MyTabBarController.h
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/9.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXTabBarController : UITabBarController

@property(nonatomic, strong) UIView *keyWindow;
- (UIView *)createMenuView;


//- (instancetype) initWithAppKeyWindow:(UIView *)keyWindow;

@end

