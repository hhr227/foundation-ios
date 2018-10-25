//
//  Foundation.h
//  ipy-ios
//
//  Created by hhr on 2018/10/25.
//  Copyright © 2018年 hhr. All rights reserved.
//

#ifndef Foundation_h
#define Foundation_h

#import "StringUtils.h"
#import "RLMObject+JSON.h"

// 屏幕宽度
#define ScreenWidth     ([[UIScreen mainScreen] bounds].size.width)

// 屏幕高度
#define ScreenHeight    ([[UIScreen mainScreen] bounds].size.height)

// 设置颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

#endif /* Foundation_h */
