//
//  BasePopView.h
//  wisdom
//
//  Created by hhr on 2018/5/30.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+LewPopupViewController.h"

@interface BasePopView : UIView

@property (nonatomic, weak)UIViewController *parentVC;

-(void)show;

-(void)dismiss;

-(BOOL)isShowing;

@end
