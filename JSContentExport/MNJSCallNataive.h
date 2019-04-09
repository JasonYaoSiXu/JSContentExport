//
//  MNJSCallNataive.h
//  JSContentExport
//
//  Created by WKCaesar on 2019/4/9.
//  Copyright © 2019 姚驷旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JSExport.h>

@protocol MNJSCallNataiveProtocol <JSExport>

- (void)pkgMgrNativeApi:(NSString *)ref;
- (void)pkgMgrNativeApi1:(double)x;

@end


NS_ASSUME_NONNULL_BEGIN

@interface MNJSCallNataive : NSObject <MNJSCallNataiveProtocol>



@end

NS_ASSUME_NONNULL_END
