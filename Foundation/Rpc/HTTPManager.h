//
//  HTTPManager.h
//  wisdom
//
//  Created by hhr on 2018/5/28.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HTTPManager : AFHTTPSessionManager

typedef void (^success)(id response);

typedef void (^failure)(NSError *error);

typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
}HTTPMethod;

+ (instancetype)sharedManager;

-(void) request:(HTTPMethod)httpMethod uri:(NSString *)uri param:(NSDictionary *)param success:(success) success failure:(failure) failure;

@end
