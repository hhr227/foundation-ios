//
//  DigestEntity.h
//  iOS Example
//
//  Created by hhr on 2018/10/26.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "Entity.h"

@interface DigestEntity : Entity

@property (copy, nonatomic) NSString *data;
@property (assign, nonatomic) BOOL success;
@property (assign, nonatomic) int code;
@property (copy, nonatomic) NSString *msg;

@end

