//
//  UIView+UI.m
//  wisdom
//
//  Created by hhr on 2018/5/30.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "UIView+UI.h"

@implementation UIView (UI)

- (void)removeAllSubViews {
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

@end
