//
//  ThirdPartyWebViewModule.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of third party web veiw module
 *
 */

#import "ThirdPartyWebViewModule.h"


@implementation ThirdPartyWebViewModule

- (instancetype)init {
    
    self = [self initWithUrl:@"http://www.softwaremerchant.com"];
    return self;
}

- (instancetype)initWithUrl:(NSString *)u {
    
    self = [super init];
    if (self) {
        self.url = u;
    }
    return self;
}

- (NSURLRequest *)request {
    
    return [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
}

@end
