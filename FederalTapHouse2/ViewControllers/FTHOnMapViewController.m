//
//  FTHOnMapViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHOnMapViewController.h"
#import <MapKit/MapKit.h>
@interface FTHOnMapViewController ()<MKMapViewDelegate>

@end

@implementation FTHOnMapViewController{

    MKMapView * myMapView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    float w = self.view.bounds.size.width;
    float h = self.view.bounds.size.height;
    
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    myMapView.delegate = self;
    myMapView.zoomEnabled = YES;
    [self.view addSubview:myMapView];
// to do
    //  in directions view query current location.....then compare.
    // set up annotation for actual restaurtant coordinates.
     //Coordinates : (40039530 , -76305993).
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
