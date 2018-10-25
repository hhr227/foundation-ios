//
//  BaseAppDelegate.h
//  wisdom
//
//  Created by hhr on 2018/6/6.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedAppDelegate;

@end
