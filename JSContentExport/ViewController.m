//
//  ViewController.m
//  JSContentExport
//
//  Created by WKCaesar on 2019/4/9.
//  Copyright © 2019 姚驷旭. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JSContext.h>
#import "MNJSCallNataive.h"

@interface ViewController () <UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) JSContext *context;
@property (strong, nonatomic) MNJSCallNataive *callNative;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialWebView];
    
    NSURL *url = [[NSURL alloc] initWithString:[self getHtmlFilePath]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
    self.callNative = [[MNJSCallNataive alloc] init];
}


- (void)initialWebView {
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _webView.backgroundColor = [UIColor brownColor];
    _webView.center = self.view.center;
    _webView.delegate = self;
    [self.view addSubview:_webView];
}

- (NSString *)getHtmlFilePath {
    NSString *string = @"";
    string = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    return string;
}

//MARK:- UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    _context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    JSValue *value = [JSValue valueWithObject:_callNative inContext:_context];
    [_context setObject:value forKeyedSubscript:@"pkgMgrNativeApi"];
    
    __weak typeof(self)weakSelf = self;
    _context[@"callNative"] = ^(NSString *func, NSString *param, NSString *callBack) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf callNative:func param:param callBack:callBack];
    };
    
    _context[@"callNative1"] = ^(NSString *func, NSString *param, NSString *callBack) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf callNative1:func param:param callBack:callBack];
    };

}

- (void)callNative:(NSString *)func param:(NSString *)param callBack:(NSString *)callBack {
    NSLog(@"%s,%@,%@,%@",__FUNCTION__,func, param, callBack);
}

- (void)callNative1:(NSString *)func param:(NSString *)param callBack:(NSString *)callBack {
    NSLog(@"%s,%@,%@,%@",__FUNCTION__,func, param, callBack);
}


- (void)runNative {
    NSLog(@"------->");
}

- (void)pkgMgrNativeApi {
    NSLog(@"------->");
}

@end
