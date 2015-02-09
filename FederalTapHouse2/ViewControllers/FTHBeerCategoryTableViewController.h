//
//  FTHBeerCategoryTableViewController.h
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceConnectionModule.h"

@class BeerDictionary;

@interface FTHBeerCategoryTableViewController : UITableViewController <WebServiceConnectionDidFinishSignal> {
    UIActivityIndicatorView *spinner;
    UIBarButtonItem *reloadButton;
    NSArray *beerCategories;
    BeerDictionary *beerDictionary;
}

@end
