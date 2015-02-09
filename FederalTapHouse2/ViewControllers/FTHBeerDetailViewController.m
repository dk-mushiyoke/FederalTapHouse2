//
//  FTHBeerDetailViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHBeerDetailViewController.h"
#import "BeerObject.h"

@interface FTHBeerDetailViewController ()

@end

@implementation FTHBeerDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.beerName.text = self.beer.beer_name;
    self.beerLocation.text = self.beer.beer_location;
    self.beerABV.text = self.beer.beer_ABV;
    self.beerSize.text = self.beer.beer_size;
    self.beerPrice.text = self.beer.beer_price;
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
