//
//  WebServiceXMLDeviceTokenParserModule.m
//  FederalTapHouse2
//
//  Created by Di Kong on 3/20/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "WebServiceXMLDeviceTokenParserModule.h"

@implementation WebServiceXMLDeviceTokenParserModule {
    NSMutableDictionary *userTokenDictionaryMutable;
    NSString *currentUserId;
    NSString *currentDeviceToken;
}


/* Default constructor */
- (instancetype)init {
    
    self = [self initWithData:nil];
    return self;
}

/* Designated constructor with data */
- (instancetype)initWithData:(NSData *)d {
    
    self = [super init];
    
    if (self) {
        self.data = d;
        userTokenDictionaryMutable = [NSMutableDictionary dictionary];
    }
    
    return self;
}


/* The parse method */
- (void)startParsing {
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.data];
    [parser setDelegate:self];
    [parser parse];
    parser = nil;
    
}

- (NSDictionary *)userTokenDictionary {

    return [NSDictionary dictionaryWithDictionary:userTokenDictionaryMutable];
}


#pragma mark - XML Parser Delegate Method

/* Called when parsing end tag (such as </Beer>) */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    /*NSLog(@"currentElement=%@", currentElement);*/
    if ([elementName isEqualToString:@"UserID"])
        currentUserId = [currentElement copy];
    else if ([elementName isEqualToString:@"DeviceTokenName"])
        currentDeviceToken = [currentElement copy];
    else if ([elementName isEqualToString:@"DeviceToken"])
        [userTokenDictionaryMutable setObject:currentDeviceToken forKey:currentUserId];
    /*else if ([elementName isEqualToString:@"ArrayOfDeviceToken"])
        NSLog(@"%@", self.userTokenDictionary);*/
    /*else if ([elementName isEqualToString:@"soap:Body"]);
    else if ([elementName isEqualToString:@"soap:Envelope"]);*/
}

/* Called when parsing start tag (such as <Beer>) */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    currentElement = [NSMutableString string];
}

/* Called when parsing text in between paired tags */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    [currentElement appendString:string];
}

@end
