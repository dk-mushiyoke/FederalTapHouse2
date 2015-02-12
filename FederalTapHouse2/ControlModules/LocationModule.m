//
//  LocationModule.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of location module
 *
 */

#import "LocationModule.h"
#import "Annotation.h"


@interface LocationModule ()

@property (nonatomic, readwrite) CLLocationManager *locationManager;

@end


@implementation LocationModule

/* Default constructor */
- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        annotationTitleList = @[@"Bus stop", @"Train station", @"Ferry port", @"Subway station", @"Parking lot", @"Bicycle lot", @"Airport", @"Time machine"];
        
        srand48((unsigned int) time(NULL));
    }
    return self;
}

/* Returns an array of random annotations for given count, center and span */
- (NSArray *)generateRandomAnnotationsWithCount:(NSUInteger)count center:(CLLocation *)center span:(MKCoordinateSpan)span {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < count; i ++) {
        Annotation *a = [[Annotation alloc] initWithTitle:[self generateRandomAnnotationTitle]
                                               coordinate:[self generateRandomCoordinate:center.coordinate span:span]];
        [array addObject:a];
    }
    return array;
}

/* Private method to generate title for annotations */
- (NSString *)generateRandomAnnotationTitle {
    
    int rand = arc4random_uniform((unsigned int) annotationTitleList.count);
    return annotationTitleList[rand];
}

/* Private method to generate coordinates for annotations */
- (CLLocationCoordinate2D) generateRandomCoordinate:(CLLocationCoordinate2D)center span:(MKCoordinateSpan)span {
    double borderLat = span.latitudeDelta / 2;
    double borderLon = span.longitudeDelta / 2;
    double randomLat = drand48();
    double randomLon = drand48();
    if (randomLat > 0.5)
        randomLat = (0.5 - randomLat) * borderLat + center.latitude;
    else
        randomLat = randomLat * borderLat + center.latitude;
    if (randomLon > 0.5)
        randomLon = (0.5 - randomLon) * borderLon + center.longitude;
    else
        randomLon = randomLon * borderLon + center.longitude;
    NSLog(@"Random latitude = %f, longitude = %f", randomLat, randomLon);
    return CLLocationCoordinate2DMake(randomLat, randomLon);
}


#pragma mark - Location Manager Delegate

/* Location successfully update */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (locations.count < 1) {
        NSLog(@"Cannot locate device");
        return;
    }
    
    [manager stopUpdatingLocation];
    [self.locationDelegate locationDidUpdateSignalFrom:self currentLocation:locations[0]];
    
}


@end
