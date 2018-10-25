//
//  BaseViewController.m
//  wisdom
//
//  Created by hhr on 2018/4/3.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Toast.h"

@interface BaseViewController () {

@private
    BOOL _isFirstLayout;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    // 返回按钮设置
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] init];
    backBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    [super viewDidLoad];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = true;
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.translucent = false;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _hasNavigationBar = YES;
    _isFirstLayout = true;
}

- (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated {
    controller.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:controller animated:true];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:!_hasNavigationBar animated:animated];
    
    if (self.hasKeybordListener) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    if (self.hasKeybordListener) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}

#pragma mark 键盘弹出监听
-(void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // 如果使用第3方键盘时,会调用3次,这里做个判断,只取最后一次
    CGRect benginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if((benginFrame.size.height > 0 && (benginFrame.origin.y - endFrame.origin.y > 0)) || [notification.name isEqualToString:UIKeyboardWillHideNotification]) {
        
        NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        NSTimeInterval animationDuration;
        [animationDurationValue getValue:&animationDuration];
        
        [UIView animateWithDuration:animationDuration animations:^{
            [self onKeybordShow:endFrame.size.height];
        } completion:^(BOOL finished){
            
        }];
    }
}

#pragma mark 键盘隐藏监听
- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary* userInfo = [notification userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self onKeybordHide];
    }];
}

-(void)onKeybordShow:(int)keybordHeight {
    
}

-(void)onKeybordHide {
    
}

- (id)initWithDefaultNibName:(Class)clz {
    return [self initWithNibName:NSStringFromClass(clz) bundle:nil];
}

#pragma mark 初始化右边按钮
-(void)initRightButton:(NSString *)text block:(OnRightButtonClickBlock)block {
    
    _block = block;
    // 初始化右边按钮
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightButton setTitle:text forState:UIControlStateNormal];
    [rightButton setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    [rightButton setTitleColor:UIColorFromRGB(0x7F7F7F) forState:UIControlStateHighlighted];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [rightButton addTarget:self action:@selector(onRightButtonClickListener:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}


-(void)onRightButtonClickListener:(UIButton *)sender {
    if (_block) {
        _block();
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (_isFirstLayout) {
        _isFirstLayout = false;
        [self viewDidFirstLayout];
    }
}

- (void)viewDidFirstLayout {
    
}

#pragma mark - Toast
-(void)makeToast:(NSString *)toast {
    [self makeToast:toast view:self.view];
}

-(void)makeToast:(NSString *)toast view:(UIView *)view  {
    [view makeToast:toast duration:0.8f position:CSToastPositionCenter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
