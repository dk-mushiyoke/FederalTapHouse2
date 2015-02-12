//
//  Annotation.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of annotation class
 *
 */

#import "Annotation.h"


@implementation Annotation

- (instancetype)init {
    
    self = [self initWithTitle:@"Default location" coordinate:CLLocationCoordinate2DMake(40.759211, 73.984638)];
    return self;
}

- (instancetype)initWithTitle:(NSString *)t coordinate:(CLLocationCoordinate2D)c {
    
    self = [super init];
    if (self) {
        self.title = t;
        self.coordinate = CLLocationCoordinate2DMake(c.latitude, c.longitude);
    }
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@\nLatitude: %.4f\nLongtitude: %.4f", self.title, self.coordinate.latitude, self.coordinate.longitude];
}

@end
