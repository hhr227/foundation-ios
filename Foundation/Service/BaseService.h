//
//  BaseService.h
//  wisdom
//
//  Created by hhr on 2018/4/3.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foundation.h"

typedef void (^success)(id response);

typedef void (^failure)(NSError *error);

@interface BaseService : NSObject

-(void) sendGet:(NSString *) uri param:(NSDictionary *) param class:(Class) clz success:(success) success failure:(failure) failure;

-(void) sendPost:(NSString *) uri param:(NSDictionary *) param class:(Class) clz success:(success) success failure:(failure) failure;

-(void) sendPut:(NSString *) uri param:(NSDictionary *) param class:(Class) clz success:(success) success failure:(failure) failure;

-(void) sendDelete:(NSString *) uri param:(NSDictionary *) param class:(Class) clz success:(success) success failure:(failure) failure;

@end
