//
//  FTHOnMapViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHOnMapViewController.h"
#import <MapKit/MapKit.h>
@interface FTHOnMapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;

- (IBAction)directionsButtonPressed:(id)sender;
@end

@implementation FTHOnMapViewController{
    CLLocationManager * locationManager;
    MKPointAnnotation * myAnnotation;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myMapView.delegate = self;
    self.myMapView.zoomEnabled = YES;
    self.myMapView.showsUserLocation = YES;
    

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    myAnnotation = [[MKPointAnnotation alloc]init];
    myAnnotation.coordinate = CLLocationCoordinate2DMake(40.759211, 73.984638);
    [self.myMapView addAnnotation:myAnnotation];
    
    
}

-(void)showUserLocation:(CLLocation*)location
{
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
    [self.myMapView setRegion:region animated:YES];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    [locationManager stopUpdatingLocation];
    
    NSLog(@"Actually found more than one (aka) %d locations", (int)[locations count]);
    
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{

    {
        // If it's the user location, just return nil.
        if (self.myMapView.userLocation.location.coordinate.latitude == annotation.coordinate.latitude
            && self.myMapView.userLocation.location.coordinate.longitude == annotation.coordinate.longitude)
            return nil;
    }{
        // Handle any custom annotations.
        if ([annotation isKindOfClass:[MKPointAnnotation class]])
        {
            // Try to dequeue an existing pin view first.
            MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
            if (!pinView)
            {
                pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            } else {
                pinView.annotation = annotation;
            }
            return pinView;
        }
        return nil;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)directionsButtonPressed:(id)sender {

    NSLog(@"directions button was Pressed");

    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        
        
        CLLocationCoordinate2D coordinate =
        myAnnotation.coordinate = CLLocationCoordinate2DMake(40.759211, 73.984638);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        
        // Set the directions mode to "Walking"
        // Can use MKLaunchOptionsDirectionsModeDriving instead
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        // Get the "Current User Location" MKMapItem
        MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
        // Pass the current location and destination map items to the Maps app
        // Set the direction mode in the launchOptions dictionary
        [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                       launchOptions:launchOptions];
    }
    
}



@end
