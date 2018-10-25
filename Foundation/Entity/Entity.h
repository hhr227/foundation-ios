//
//  Entity.h
//  wisdom
//
//  Created by hhr on 2018/5/29.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "RLMObject.h"

@interface Entity : RLMObject

@property (copy, nonatomic) NSString *id;
@property (copy, nonatomic) NSString *entityId;

@end
