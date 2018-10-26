//
//  TestService.m
//  iOS Example
//
//  Created by hhr on 2018/10/25.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "TestService.h"

@implementation TestService

-(void)test {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"AppId"] = @"B4FA29290B474E9A885B6F03B0BFA035";
    dic[@"DeviceId"] = @"5ad344d5fc55f7cb4cfb067ca9b5b8b7";
    dic[@"Timestamp"] = @"1536033573";
    
    [self sendPostWithJson:@"http://47.99.68.184:8090/api/open/digest/get" param:dic class:nil success:^(id response) {
        NSLog(@"%@", response);
    } failure:^(NSError *error) {
        NSLog(error);
    }];
    
//    [self sendGet:@"/api/open/digest/get" param:nil class:nil success:^(id response) {
//        NSLog(@"%@", response);
//    } failure:^(NSError *error) {
//        NSLog(error);
//    }];
}

@end
