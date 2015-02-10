//
//  WebServiceConnectionModule.h
//  FederalTaphouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This module deals with all web service connection requests.
 *
 * Call establishConnection after initialization to connect.
 * Returned data can be accessed by the responseData property.
 *
 * Caller needs to implement <WebServiceConnectionDidFinishSignal>
 * so that all code within the signal delegate method will execute
 * after connectionDidFinishLoading.
 * 
 */

#import <Foundation/Foundation.h>


/* Protocol to signal caller that connectionDidFinishLoading */
@protocol WebServiceConnectionDidFinishSignal <NSObject>

- (void)signalFrom:(id)sender;

@end


/* Module interface */
@interface WebServiceConnectionModule : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate> {
    
    NSMutableData *responseDataMutable;
}

@property (nonatomic, weak)     id <WebServiceConnectionDidFinishSignal> signalDelegate;
@property (nonatomic, copy)     NSString *url;
@property (nonatomic, copy)     NSString *method;
@property (nonatomic, readonly) NSData *responseData;

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

- (instancetype)init;
- (instancetype)initWithUrl:(NSString *)u method:(NSString *)m;
-(instancetype)initWithUrl:(NSString *)u Username:(NSString *)username Password:(NSString *)password method:(NSString *)m;
- (void)establishConnection;

@end
