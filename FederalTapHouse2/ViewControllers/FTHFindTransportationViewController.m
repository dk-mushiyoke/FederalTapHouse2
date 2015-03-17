//
//  FTHFindTransportationViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHFindTransportationViewController.h"
#import "Annotation.h"

@interface FTHFindTransportationViewController ()

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation FTHFindTransportationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Update"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(reloadMapView:)];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];

    /*[self reloadMapView:nil];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Reload action when user location changes */
- (void)reloadMapView:(id)sender {
    [self.locationManager startUpdatingLocation];
}

/* Create local search object to find transportations and drop pins on map */
- (void)searchAndUpdateTransportation:(MKCoordinateRegion)region {
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"public transportation";
    request.region = region;
    
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    // Search with complete handler updating mapView
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSMutableArray *placemarks = [NSMutableArray array];
        for (MKMapItem *mi in response.mapItems) {
            Annotation *a = [[Annotation alloc] init];
            [a setTitle:mi.placemark.name];
            [a setSubtitle:mi.placemark.title];
            [a setCoordinate:mi.placemark.coordinate];
            [placemarks addObject:a];
        }
        [self.mapView removeAnnotations:self.mapView.annotations];
        [self.mapView showAnnotations:placemarks animated:YES];
    }];
}


#pragma mark - Map View Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    CLLocationCoordinate2D currentLocation = mapView.userLocation.location.coordinate;
    if (currentLocation.latitude != annotation.coordinate.latitude || currentLocation.longitude != annotation.coordinate.longitude) {
        MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
        if (pinAnnotationView == nil) {
            pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                reuseIdentifier:@"Pin"];
        }
        pinAnnotationView.canShowCallout = YES;
        return pinAnnotationView;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {

    [self reloadMapView:nil];
}


#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    if (locations.count < 1) {
        NSLog(@"Cannot locate device");
        return;
    }
    
    [manager stopUpdatingLocation];
    
    CLLocation *location = locations[0];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, span);
    
    [self searchAndUpdateTransportation:region];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
