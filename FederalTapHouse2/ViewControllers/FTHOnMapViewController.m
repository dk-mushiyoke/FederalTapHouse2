//
//  FTHOnMapViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "FTHOnMapViewController.h"
#import "Annotation.h"

@interface FTHOnMapViewController ()
@end

#define FEDERAL_LATITUDE 40.041404
#define FEDERAL_LONGITUDE -76.305782


@implementation FTHOnMapViewController{
    CLLocationManager * locationManager;
    Annotation *myAnnotation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myMapView.delegate = self;
    self.myMapView.zoomEnabled = YES;
    self.myMapView.showsUserLocation = YES;
    

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    
    myAnnotation = [[Annotation alloc] initWithTitle:@"Federal Taphouse" coordinate:CLLocationCoordinate2DMake(FEDERAL_LATITUDE, FEDERAL_LONGITUDE)];
    [self.myMapView addAnnotation:myAnnotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showUserLocation:(CLLocation*)location
{
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
    [self.myMapView setRegion:region animated:YES];
}

- (IBAction)directionsButtonPressed:(id)sender {
    
    NSLog(@"directions button was Pressed");
    
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(FEDERAL_LATITUDE, FEDERAL_LONGITUDE);
        NSDictionary *addressDict = @{
                                      (__bridge NSString *) kABPersonAddressStreetKey : @"201 N Queen Street",
                                      (__bridge NSString *) kABPersonAddressCityKey : @"Lancaster",
                                      (__bridge NSString *) kABPersonAddressStateKey : @"PA",
                                      (__bridge NSString *) kABPersonAddressZIPKey : @"17603",
                                      (__bridge NSString *) kABPersonAddressCountryKey : @"United States"
                                      };
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:addressDict];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        
        // Set the directions mode to "Driving"
        // Can use MKLaunchOptionsDirectionsModeWalking instead
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        // Get the "Current User Location" MKMapItem
        MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
        // Pass the current location and destination map items to the Maps app
        // Set the direction mode in the launchOptions dictionary
        [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                       launchOptions:launchOptions];
    }
    
}


#pragma mark - Location Manager Delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    [locationManager stopUpdatingLocation];
    
    NSLog(@"Actually found more than one (aka) %d locations", (int)[locations count]);
    /*[self showUserLocation:locations[0]];*/    
}


#pragma mark - Map View Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    Annotation *a = annotation;
    NSLog(@"lat=%f, log=%f", a.coordinate.latitude, a.coordinate.longitude);
    CLLocationCoordinate2D currentLocation = mapView.userLocation.location.coordinate;
        // If it's the user location, just return nil.
    if (currentLocation.latitude == a.coordinate.latitude
        && currentLocation.longitude == a.coordinate.longitude)
        return nil;
    // Try to dequeue an existing pin view first.
    MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
    if (!pinView)
    {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:a reuseIdentifier:@"CustomPinAnnotationView"];
    } else {
        pinView.annotation = a;
    }
    return pinView;
}


@end
