//
//  ViewUtils.m
//  wisdom
//
//  Created by hhr on 2018/5/30.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils

+ (id)loadViewWithViewClass:(Class)viewClass {
    return [ViewUtils loadViewWithViewClass:viewClass owner:nil];
}

+ (id)loadViewWithViewClass:(Class)viewClass atIndex:(int)index {
    return [ViewUtils loadViewWithViewClass:viewClass owner:nil atIndex:index];
}

+ (id)loadViewWithViewClass:(Class)viewClass owner:(id)owner {
    return [ViewUtils loadViewWithViewClass:viewClass owner:owner atIndex:0];
}

+ (id)loadViewWithViewClass:(Class)viewClass owner:(id)owner atIndex:(int)index {
    return [ViewUtils loadViewFromNib:NSStringFromClass(viewClass) owner:owner atIndex:index];
}

+ (id)loadViewFromNib:(NSString *)nibName {
    return [ViewUtils loadViewFromNib:nibName owner:nil atIndex:0];
}

+ (id)loadViewFromNib:(NSString *)nibName owner:(id)owner {
    return [ViewUtils loadViewFromNib:nibName owner:owner atIndex:0];
}

+ (id)loadViewFromNib:(NSString *)nibName atIndex:(int)index {
    return [ViewUtils loadViewFromNib:nil owner:nil atIndex:index];
}

+ (id)loadViewFromNib:(NSString *)nibName owner:(id)owner atIndex:(int)index {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:nil];
    
    if (index >= 0 && index < views.count) {
        return views[index];
    }
    
    return nil;
}

+ (void)removeAllSubViews:(UIView *)view {
    for (UIView *subView in view.subviews) {
        [subView removeFromSuperview];
    }
}

+ (void)removeSubViews:(UIView *)view fromIndex:(int)index {
    if (index >= view.subviews.count) {
        return;
    }
    
    for (int i=index; i<view.subviews.count; i++) {
        [view.subviews[i] removeFromSuperview];
    }
}

+ (void)removeSubView:(UIView *)view atIndex:(int)index {
    if (index >= view.subviews.count) {
        return;
    }
    
    [view.subviews[index] removeFromSuperview];
}

@end
