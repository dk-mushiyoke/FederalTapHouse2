//
//  WebServiceXMLParserModule.m
//  FederalTaphouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of web service XML parser module
 *
 */

#import "WebServiceXMLParserModule.h"
#import "BeerObject.h"
#import "BeerDictionary.h"


@interface WebServiceXMLParserModule()

@property (nonatomic, readwrite) BeerDictionary *beerDictionary;

@end


@implementation WebServiceXMLParserModule

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
        self.beerDictionary = [[BeerDictionary alloc] init];
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


#pragma mark - XML Parser Delegate Method

/* Called when parsing end tag (such as </Beer>) */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    // End tag with Beer = finished parsing for a beer
    if ([elementName isEqualToString:@"Beer"]) {
        /*NSLog(@"%@", currentBeer);*/
        [self.beerDictionary addBeer:currentBeer];
    }
    // End tag with getBeerListResult = finished getBeerList
    else if ([elementName isEqualToString:@"getBeerListResult"]) {
         NSLog(@"Beer List Updated");
    }
    // End tag says these craps that is not a property in beer object, I just skip them
    else if ([elementName isEqualToString:@"getBeerListResponse"]);
    else if ([elementName isEqualToString:@"soap:Body"]);
    else if ([elementName isEqualToString:@"soap:Envelope"]);
    // End tag with everything else I use KVC to set beer's properties
    else {
        [currentBeer setValue:currentElement forKey:elementName];
    }
}

/* Called when parsing start tag (such as <Beer>) */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:@"Beer"])
        currentBeer = [[BeerObject alloc] init];
    else
        currentElement = [NSMutableString string];
}

/* Called when parsing text in between paired tags */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    [currentElement appendString:string];
}

@end
