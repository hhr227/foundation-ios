//
//  HTTPManager.m
//  wisdom
//
//  Created by hhr on 2018/5/28.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager

+ (instancetype)sharedManager {
    static HTTPManager *manager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

#pragma mark 初始化请求地址
- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer.timeoutInterval = 5;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}

-(void)request:(HTTPMethod)httpMethod uri:(NSString *)uri param:(NSDictionary *)param success:(success)success failure:(failure)failure {
    if (httpMethod == GET) {
        [self GET: [uri stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

@end
