//
//  Annotation.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

- (instancetype)init {
    
    self = [self initWithTitle:@"Default location" coordinate:CLLocationCoordinate2DMake(40.0397, 76.3044)];
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

- (double)latitude {
    
    return self.coordinate.latitude;
}

- (double)longitude {
    
    return self.coordinate.longitude;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@\nLatitude: %.4f\nLongtitude: %.4f", self.title, self.latitude, self.longitude];
}

@end
