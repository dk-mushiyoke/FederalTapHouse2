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

@end

@implementation FTHFindTransportationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Update"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(reloadMapView:)];
    initRun = YES;
    locationModule = [[LocationModule alloc] init];
    [locationModule setLocationDelegate:self];

    [self reloadMapView:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadMapView:(id)sender {
    [locationModule.locationManager startUpdatingLocation];
}


#pragma mark - Map View Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    Annotation *a = annotation;
    CLLocationCoordinate2D currentLocation = mapView.userLocation.location.coordinate;
    if (currentLocation.latitude != a.coordinate.latitude || currentLocation.longitude != a.coordinate.longitude) {
        MKPinAnnotationView *pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:a
                                                                                 reuseIdentifier:@"Pin"];
        pinAnnotationView.canShowCallout = YES;
        return pinAnnotationView;
    }
    return nil;
}


#pragma mark - Location Module Delegate

- (void)locationDidUpdateSignalFrom:(id)sender currentLocation:(CLLocation *)location {
    /*NSLog(@"Device location: lat %f long %f", location.coordinate.latitude, location.coordinate.longitude);*/
    MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, span);
    if (initRun) {
        [self.mapView setRegion:region animated:NO];
        initRun = NO;
    }
    else {
        [self.mapView setRegion:region animated:YES];
    }
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:[locationModule generateRandomAnnotationsWithCount:8 center:location span:span]];
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
