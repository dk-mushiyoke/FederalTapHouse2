//
//  WebServiceXMLLoginParserModule.h
//  FederalTapHouse2
//
//  Created by Masih Tabrizi on 2/9/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceXMLLoginParserModule : NSObject <NSXMLParserDelegate>  {
    
    NSMutableString *currentElement;
    
}

@property (nonatomic, strong)   NSData *data;

- (instancetype)init;
- (instancetype)initWithData:(NSData *)d;
- (void)startParsing;

@end
