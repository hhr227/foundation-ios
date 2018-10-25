//
//  BaseAppDelegate.m
//  wisdom
//
//  Created by hhr on 2018/6/6.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "BaseAppDelegate.h"

@implementation BaseAppDelegate

+ (instancetype)sharedAppDelegate {
    return (BaseAppDelegate *)[UIApplication sharedApplication].delegate;
}

@end
