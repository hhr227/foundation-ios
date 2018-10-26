//
//  ViewController.m
//  iOS Example
//
//  Created by hhr on 2018/10/25.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "ViewController.h"
#import "TestService.h"

@interface ViewController () {
    TestService *testService;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    testService = [TestService new];
    [testService test];
}


@end
