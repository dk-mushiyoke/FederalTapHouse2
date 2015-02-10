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


@implementation EventObject

- (instancetype)init {
    
    self = [self initWithName:nil time:nil place:nil description:nil];
    return self;
}

- (instancetype)initWithName:(NSString *)name time:(NSString *)time place:(NSString *)place description:(NSString *)dscptn {
    
    self = [super init];
    
    if (self) {
        self.eventName = name;
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

- (NSString *)description {

    return [NSString stringWithFormat:@"Event name: %@\nEvent time: %@\nEvent place: %@\nEvent description: %@\nRSVP list: %@",
            self.eventName, self.eventTime, self.eventPlace, self.eventDescription, self.eventRSVPList];
}

@end
