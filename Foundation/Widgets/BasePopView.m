//
//  BasePopView.m
//  wisdom
//
//  Created by hhr on 2018/5/30.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "BasePopView.h"
#import "LewPopupViewAnimationFade.h"
#import "LewPopupViewAnimationSlide.h"
#import "LewPopupViewAnimationSpring.h"
#import "LewPopupViewAnimationDrop.h"

@implementation BasePopView {
    BOOL isShow;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    isShow = false;
}

-(void)show {
    isShow = true;
    [self.parentVC lew_presentPopupView:self animation:[LewPopupViewAnimationSlide new] dismissed:nil];
}

-(void)dismiss {
    [self.parentVC lew_dismissPopupView];
    isShow = false;
}

-(BOOL)isShowing {
    return isShow;
}

@end
