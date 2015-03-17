//
//  Annotation.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This class serves as a prototype for annotation pins displayed on map
 *
 */

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *subtitle;

- (instancetype)init;
- (instancetype)initWithTitle:(NSString *)t coordinate:(CLLocationCoordinate2D)c;

@end
