//
//  EventObject.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of event object
 *
 */

#import "EventObject.h"


@interface EventObject ()

@end


@implementation EventObject

- (instancetype)init {
    
    self = [self initWithTime:nil place:nil description:nil];
    return self;
}

- (instancetype)initWithTime:(NSString *)time place:(NSString *)place description:(NSString *)dscptn {
    
    self = [super init];
    
    if (self) {
        self.eventTime = time;
        self.eventPlace = place;
        self.eventDescription = dscptn;
        rsvpList = [NSMutableArray array];
    }
    
    return self;
}

- (NSArray *)eventRSVPList {
    return [NSArray arrayWithArray:rsvpList];
}

- (void)addRSVP:(NSString *)name {
    [rsvpList addObject:name];
}

- (BOOL)findRSVP:(NSString *)name {
    return [rsvpList containsObject:name];
}

@end
