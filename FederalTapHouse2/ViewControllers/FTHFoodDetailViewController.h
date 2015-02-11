//
//  FTHFoodItemTableViewController.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodObject.h"

@interface FTHFoodDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodPrice;
@property (weak, nonatomic) IBOutlet UITextView *foodDescription;
@property (nonatomic, strong) FoodObject *food;

@end
