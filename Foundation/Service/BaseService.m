//
//  BaseService.m
//  wisdom
//
//  Created by hhr on 2018/4/3.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

-(void)sendGet:(NSString *)uri param:(NSDictionary *)param class:(Class) clz success:(success)success failure:(failure)failure {
    [self request:GET uri:uri isJson:false param:param class:clz success:success failure:failure];
}

-(void)sendPost:(NSString *)uri param:(NSDictionary *)param class:(Class) clz success:(success)success failure:(failure)failure {
    [self request:POST uri:uri isJson:false param:param class:clz success:success failure:failure];
}

-(void)sendDelete:(NSString *)uri param:(NSDictionary *)param class:(Class) clz success:(success)success failure:(failure)failure {
    [self request:PUT uri:uri isJson:false param:param class:clz success:success failure:failure];
}

-(void)sendPut:(NSString *)uri param:(NSDictionary *)param class:(Class) clz success:(success)success failure:(failure)failure {
    [self request:DELETE uri:uri isJson:false param:param class:clz success:success failure:failure];
}

#pragma mark json请求参数
-(void)sendPostWithJson:(NSString *)uri param:(NSDictionary *)param class:(Class)clz success:(success)success failure:(failure)failure {
    [self request:POST uri:uri isJson:true param:param class:clz success:success failure:failure];
}

-(void)sendPutWithJson:(NSString *)uri param:(NSDictionary *)param class:(Class)clz success:(success)success failure:(failure)failure {
    [self request:PUT uri:uri isJson:true param:param class:clz success:success failure:failure];
}

-(void)sendDeleteWithJson:(NSString *)uri param:(NSDictionary *)param class:(Class)clz success:(success)success failure:(failure)failure {
    [self request:DELETE uri:uri isJson:true param:param class:clz success:success failure:failure];
}

-(void)request:(HTTPMethod) httpMethod uri:(NSString *)uri isJson:(BOOL)isJson param:(NSDictionary *)param class:(Class) clz success:(success)success failure:(failure)failure {
    [[HTTPManager sharedManager] request:httpMethod uri:uri isJson:isJson param:param success:^(id response) {
        if (clz == nil || response == nil) {
            success(nil);
        } else {
            if ([response isKindOfClass:[NSArray class]]) {
                NSMutableArray *records = [[NSMutableArray alloc] init];
                for (NSDictionary *node in response) {
                    id entity = [RLMObject initWithJSONDictionary:node andClass:clz];
                    [records addObject:entity];
                }
                success(records);
            } else {
                id entity = [RLMObject initWithJSONDictionary:response andClass:clz];
                success(entity);
            }
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

#pragma mark 统一异常处理
-(void)handleError:(NSError *) error {
    
}

@end
