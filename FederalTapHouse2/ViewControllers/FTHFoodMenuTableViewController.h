//
//  FTHFoodCategoryTableViewController.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MenuDictionary;

@interface FTHFoodMenuTableViewController : UITableViewController {
    MenuDictionary *menu;
    NSArray *foodCategories;
}


@end
