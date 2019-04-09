//
//  MNJSCallNataive.m
//  JSContentExport
//
//  Created by WKCaesar on 2019/4/9.
//  Copyright © 2019 姚驷旭. All rights reserved.
//

#import "MNJSCallNataive.h"
#import <JavaScriptCore/JSContext.h>

@implementation MNJSCallNataive

- (void)pkgMgrNativeApi:(NSString *)ref {
    NSLog(@"%s,%@",__FUNCTION__,ref);
}

- (void)pkgMgrNativeApi1:(double)x {
    NSLog(@"%s,%f",__FUNCTION__,x);
    JSContext *context = [JSContext currentContext];
    JSValue *value = [context evaluateScript:@"alertMessage(\"WKCaesar\")"];
    NSLog(@"-----%@",value);
}

@end
