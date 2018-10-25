//
//  BaseViewController.h
//  wisdom
//
//  Created by hhr on 2018/4/3.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Foundation.h"

typedef void(^OnRightButtonClickBlock)(void);

@interface BaseViewController : UIViewController

// 右侧按钮点击Block
@property (copy, nonatomic) OnRightButtonClickBlock block;
// 默认有NavigationBar（如果没有需要设置为false）
@property (assign, nonatomic) BOOL hasNavigationBar;
// 是否有键盘监听
@property (assign, nonatomic) BOOL hasKeybordListener;

-(id)initWithDefaultNibName:(Class)clz;

-(void)viewDidFirstLayout;

-(void)pushViewController:(UIViewController *)controller animated:(BOOL)animated;

-(void)onKeybordShow:(int) keybordHeight;

-(void)onKeybordHide;

-(void)makeToast:(NSString *)toast;

-(void)initRightButton:(NSString *)text block:(OnRightButtonClickBlock)block;

@end
