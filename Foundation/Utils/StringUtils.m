//
//  StringUtils.m
//  CompanyPlus
//
//  Created by Jackson Fu on 15/8/6.
//  Copyright (c) 2015年 厦门象形远教网络科技有限公司. All rights reserved.
//

#import "StringUtils.h"

@implementation StringUtils

+ (BOOL)isEmpty:(NSString *)str {
    return (str == nil || str.length == 0);
}

+ (BOOL)isNotEmpty:(NSString *)str {
    return ![StringUtils isEmpty:str];
}

@end
