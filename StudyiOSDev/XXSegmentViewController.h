//
//  XXSegmentViewController.h
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/12.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomViewController.h"

#define Screen                              [UIScreen mainScreen]
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenSize                          [[UIScreen mainScreen] bounds].size
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface XXSegmentViewController : CustomViewController

@end
