//
//  FederalTapHouse2Tests.m
//  FederalTapHouse2Tests
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BeerDictionary.h"
#import "WebServiceConnectionModule.h"
#import "WebServiceXMLBeerParserModule.h"
#import "WebServiceXMLLoginParserModule.h"
#import "WebServiceXMLDeviceTokenParserModule.h"

@interface WebServiceTests : XCTestCase <WebServiceConnectionDidFinishSignal>

@end

@implementation WebServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConnectionModule {
    // This is an example of a functional test case.
    // XCTAssert(YES, @"Pass");
    WebServiceConnectionModule *con = [[WebServiceConnectionModule alloc]
                                       initWithUrl:@"http://www.softwaremerchant.com/onlinecourse.asmx" method:@"getAllDeviceTokens"];
    [con setSignalDelegate:self];
    [con establishConnection];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
}

#pragma mark - Connection Did Finish

- (void)connectionDidFinishSignalFrom:(id)sender {
    WebServiceConnectionModule *con = sender;
    /*WebServiceXMLLoginParserModule *par = [[WebServiceXMLLoginParserModule alloc] initWithData:con.responseData];*/
    WebServiceXMLDeviceTokenParserModule *par = [[WebServiceXMLDeviceTokenParserModule alloc] initWithData:con.responseData];
    [par startParsing];
    NSLog(@"dict=%@", par.userTokenDictionary);
    
}

@end
