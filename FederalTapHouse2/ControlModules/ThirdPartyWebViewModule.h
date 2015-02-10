//
//  ThirdPartyWebViewModule.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This module processes any third party url requests and
 * returns the content for displaying on a webView
 *
 */

#import <Foundation/Foundation.h>

@interface ThirdPartyWebViewModule : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, readonly) NSURLRequest *request;

@end
