//
//  WebServiceXMLDeviceTokenParserModule.h
//  FederalTapHouse2
//
//  Created by Di Kong on 3/20/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceXMLDeviceTokenParserModule : NSObject <NSXMLParserDelegate>  {
    
    NSMutableString *currentElement;
}

@property (nonatomic, strong) NSData *data;
@property (nonatomic, readonly) NSDictionary *userTokenDictionary;

- (instancetype)init;
- (instancetype)initWithData:(NSData *)d;
- (void)startParsing;

@end
