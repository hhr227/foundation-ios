//
//  BaseWebViewController.h
//  wisdom
//
//  Created by hhr on 2018/5/30.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "WebViewJavascriptBridge.h"

@interface BaseWebViewController : BaseViewController <WKNavigationDelegate>

@property WKWebView *webView;
@property WebViewJavascriptBridge* bridge;
@property(nonatomic, copy) NSString *url;

-(void)loadUrl:(NSString *)url;

@end
