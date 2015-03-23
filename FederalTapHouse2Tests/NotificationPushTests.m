//
//  NotificationPushTests.m
//  FederalTapHouse2
//
//  Created by Di Kong on 3/23/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "WebServiceConnectionModule.h"
#import "WebServiceXMLDeviceTokenParserModule.h"
#import "NotificationConnectionModule.h"

@interface NotificationPushTests : XCTestCase <WebServiceConnectionDidFinishSignal>

@end

@implementation NotificationPushTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNotification {
    
    WebServiceConnectionModule *con = [[WebServiceConnectionModule alloc] initWithUrl:@"http://www.softwaremerchant.com/onlinecourse.asmx" method:@"getAllDeviceTokens"];
    [con setSignalDelegate:self];
    [con establishConnection];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
}


#pragma mark - Web Service Connection

- (void)connectionDidFinishSignalFrom:(id)sender {

    WebServiceConnectionModule *con = sender;
    WebServiceXMLDeviceTokenParserModule *parser = [[WebServiceXMLDeviceTokenParserModule alloc] initWithData:con.responseData];
    [parser startParsing];
    NSDictionary *userTokenDict = parser.userTokenDictionary;
    for (NSString *user in userTokenDict.allKeys) {
        NSString *token = userTokenDict[user];
        NSString *msg = [NSString stringWithFormat:@"test push to %@", user];
        NSLog(@"user = %@ token = %@", user, token);
        [NotificationConnectionModule pushWithDeviceToken:token message:msg];
    }
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    
    /*NSString *deviceToken = @"64072e43da76e9ccf942414176f8f8d02c7bed28488070460a296dc3ab446dce";
    NSString *message = @"Hello world from push test";*/

}

@end
