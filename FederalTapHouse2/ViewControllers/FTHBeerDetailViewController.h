//
//  FTHBeerDetailViewController.h
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BeerObject;

@interface FTHBeerDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *beerImage;
@property (weak, nonatomic) IBOutlet UILabel *beerName;
@property (weak, nonatomic) IBOutlet UILabel *beerSizeAndABV;
@property (weak, nonatomic) IBOutlet UILabel *beerPrice;
@property (weak, nonatomic) IBOutlet UITextView *beerDescription;
@property (nonatomic, strong) BeerObject *beer;

@end
