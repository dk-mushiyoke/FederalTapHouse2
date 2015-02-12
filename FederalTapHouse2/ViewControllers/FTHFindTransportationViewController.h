//
//  FTHFindTransportationViewController.h
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationModule.h"


@interface FTHFindTransportationViewController : UIViewController <LocationDidUpdateSignal, MKMapViewDelegate> {
    LocationModule *locationModule;
    BOOL initRun;
}

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

- (IBAction)reloadMapView:(id)sender;

@end
