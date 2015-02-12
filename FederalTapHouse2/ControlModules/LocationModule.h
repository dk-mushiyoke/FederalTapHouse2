//
//  LocationModule.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This module processes location related tasks
 * It's basically a wrapper around CLLocationManager
 * Main purpose is to generate random annotations for map view
 * to display in Find Transportations view
 *
 */

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


/* Sends a signal when location is successfully updated */
@protocol LocationDidUpdateSignal <NSObject>

- (void)locationDidUpdateSignalFrom:(id)sender currentLocation:(CLLocation *)location;

@end


@interface LocationModule : NSObject <CLLocationManagerDelegate> {
    NSArray *annotationTitleList;
}

@property (nonatomic, weak)     id <LocationDidUpdateSignal> locationDelegate;
@property (nonatomic, readonly) CLLocationManager *locationManager;

- (instancetype)init;
- (NSArray *)generateRandomAnnotationsWithCount:(NSUInteger)count center:(CLLocation *)center span:(MKCoordinateSpan)span;

@end
