//
//  Paging.h
//  wisdom
//
//  Created by hhr on 2018/6/5.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FIRST_PAGE 1
#define DEFAULT_PAGE_SIZE 10

@interface Paging : NSObject

@property (nonatomic) int page;
@property (nonatomic) int pages;
@property (nonatomic) int records;
@property (nonatomic) int pageSize;

/**
 *  根据分页大小及记录数，计算页面，调用该方法之前需要先设置pageSize及records参数
 */
- (void)calculatePages;

@end
