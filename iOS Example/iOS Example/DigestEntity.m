//
//  DigestEntity.m
//  iOS Example
//
//  Created by hhr on 2018/10/26.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "DigestEntity.h"

@implementation DigestEntity

+ (NSDictionary *)JSONInboundMappingDictionary {
    return @{
             @"Data": @"data",
             @"Code": @"code",
             @"Success": @"success",
             @"Msg": @"msg"
             };
}

@end
