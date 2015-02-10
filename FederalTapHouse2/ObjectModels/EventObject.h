//
//  EventObject.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This class models the event object
 *
 */

#import <Foundation/Foundation.h>

@interface EventObject : NSObject {
    NSMutableArray *rsvpList;
}

@property (nonatomic, copy)     NSString *eventName;
@property (nonatomic, copy)     NSString *eventTime;
@property (nonatomic, copy)     NSString *eventPlace;
@property (nonatomic, copy)     NSString *eventDescription;
@property (nonatomic, readonly) NSArray *eventRSVPList;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name time:(NSString *)time place:(NSString *)place description:(NSString *)dscrptn;
- (void)addRSVP:(NSString *)name;
- (BOOL)findRSVP:(NSString *)name;

@end
