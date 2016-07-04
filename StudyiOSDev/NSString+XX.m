//
//  MyData+XX.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/27.
//  Copyright © 2016年 孙春杰. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NSString+XX.h"

@implementation NSString (XX)

static const void *strExtra_AddressValue = &strExtra_AddressValue;

- (NSString *)strExtra {
    return objc_getAssociatedObject(self, strExtra_AddressValue);
}

- (void)setStrExtra:(NSString *)aStrExtra{
    objc_setAssociatedObject(self, strExtra_AddressValue, aStrExtra, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end


