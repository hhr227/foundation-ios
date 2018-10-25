//
//  Paging.m
//  wisdom
//
//  Created by hhr on 2018/6/5.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "Paging.h"

@implementation Paging

- (id)init {
    self = [super init];
    
    self.page = FIRST_PAGE;
    self.pageSize = DEFAULT_PAGE_SIZE;
    
    return self;
}

- (void)calculatePages {
    if (self.records == 0)
        return ;
    
    if (self.pageSize > 0){
        self.pages = (int)ceil((self.records - 1)/self.pageSize) + 1;
    }
}

@end
