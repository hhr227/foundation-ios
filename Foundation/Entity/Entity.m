//
//  Entity.m
//  wisdom
//
//  Created by hhr on 2018/5/29.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "Entity.h"

@implementation Entity

-(void)setIdPropertyValue:(id)idkeyValue {
    self.id = idkeyValue;
}

- (NSString *)entityId {
    return self.id;
}

- (void)setEntityId:(NSString *)entityId {
    self.id = entityId;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[Entity class]]) {
        return false;
    }
    
    Entity *entity = object;
    return [entity.entityId isEqualToString:self.entityId];
}

@end
