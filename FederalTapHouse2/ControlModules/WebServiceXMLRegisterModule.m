//
//  WebServiceXMLRegisterModule.m
//  FederalTapHouse2
//
//  Created by Masih Tabrizi on 3/23/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "WebServiceXMLRegisterModule.h"

@implementation WebServiceXMLRegisterModule {
    NSMutableString *resultValue;
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


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
    currentElement = [[NSMutableString alloc]init];
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    [currentElement appendString:string];
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if([elementName isEqualToString:@"registerDeviceTokenResult"]){
        _registerResult=[[NSMutableString alloc]initWithString:currentElement];
        
    }
    currentElement = nil;
}


@end
