//
//  Annotation.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Annotation : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

- (instancetype)init;
- (instancetype)initWithTitle:(NSString *)t coordinate:(CLLocationCoordinate2D)c;

@end
