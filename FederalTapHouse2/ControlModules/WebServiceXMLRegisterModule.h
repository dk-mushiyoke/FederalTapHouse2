//
//  WebServiceXMLRegisterModule.h
//  FederalTapHouse2
//
//  Created by Masih Tabrizi on 3/23/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceXMLRegisterModule : NSObject <NSXMLParserDelegate>  {
    
    NSMutableString *currentElement;
    
}

@property (nonatomic, strong)   NSData *data;
@property (nonatomic, strong) NSString *registerResult;

- (instancetype)init;
- (instancetype)initWithData:(NSData *)d;
- (void)startParsing;

@end
