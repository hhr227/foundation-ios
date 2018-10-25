//
//  BaseWebViewController.m
//  wisdom
//
//  Created by hhr on 2018/5/30.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWebView];
}

-(void)initWebView {
    self.webView = [[NSClassFromString(@"WKWebView") alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    // 初始化JS交互
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [self.bridge setWebViewDelegate:self];
    
    // 加载网页
    [self loadUrl:self.url];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidStartLoad");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"webViewDidFinishLoad");
}

//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
//    
//    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
//        
//        NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
//        
//        completionHandler(NSURLSessionAuthChallengeUseCredential,card);
//        
//    }
//}


-(void)loadUrl:(NSString *)url {
    if ([StringUtils isNotEmpty:url]) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    }
}

@end
