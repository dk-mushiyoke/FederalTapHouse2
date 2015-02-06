//
//  FederalTapHouse2Tests.m
//  FederalTapHouse2Tests
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
//#import "BeerDictionary.h"
//#import "WebServiceConnectionModule.h"
//#import "WebServiceXMLParserModule.h"

@interface FederalTapHouse2Tests : XCTestCase// <WebServiceConnectionDidFinishSignal>

@end

@implementation FederalTapHouse2Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*- (void)testConnectionModule {
    // This is an example of a functional test case.
    // XCTAssert(YES, @"Pass");
    WebServiceConnectionModule *con = [[WebServiceConnectionModule alloc]
                                       initWithUrl:@"http://www.softwaremerchant.com/onlinecourse.asmx"
                                       method:@"getBeerList"];
    [con establishConnection];
    [con setSignalDelegate:self];
}*/

/*- (void)testBeerList {
    
    BeerDictionary *list = [[BeerDictionary alloc] init];
    BeerObject *beer1 = [[BeerObject alloc] initWithName:@"Beer1" location:@"" abv:@"" size:@"" price:@""
                                             description:@"test beer" category:@"Category 1" date:@""];
    BeerObject *beer2 = [[BeerObject alloc] initWithName:@"Beer2" location:@"" abv:@"" size:@"" price:@""
                                             description:@"test beer" category:@"Category 1" date:@""];
    BeerObject *beer3 = [[BeerObject alloc] initWithName:@"Beer3" location:@"" abv:@"" size:@"" price:@""
                                             description:@"test beer" category:@"Category 3" date:@""];
    [list addBeer:beer1];
    NSLog(@"%@", list);
    [list addBeer:beer2];
    NSLog(@"%@", list);
    [list addBeer:beer3];
    NSLog(@"%@", list);
    NSLog(@"%@", [list beerListForCategory:@"Category 1"]);
}*/

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

/*#pragma mark - Connection Did Finish

- (void)signalFrom:(id)sender {
    WebServiceConnectionModule *con = sender;
    WebServiceXMLParserModule *par = [[WebServiceXMLParserModule alloc] initWithData:con.responseData];
    [par startParsing];
    for (BeerObject *b in par.beerList) {
        NSLog(@"%@", b);
    }
}*/

@end
