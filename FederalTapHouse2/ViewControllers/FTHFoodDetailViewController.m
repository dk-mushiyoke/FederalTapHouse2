//
//  FTHFoodItemTableViewController.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHFoodDetailViewController.h"

@interface FTHFoodDetailViewController ()

@end

@implementation FTHFoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.foodImage.image = self.food.foodImage;
    self.foodName.text = self.food.foodName;
    self.foodPrice.text = [NSString stringWithFormat:@"Price: %.2f", self.food.foodPriceValue];
    self.foodDescription.text = self.food.foodDescription;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
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
