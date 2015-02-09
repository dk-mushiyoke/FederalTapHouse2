//
//  FTHBeerTableViewController.h
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceConnectionModule.h"

@interface FTHBeerTableViewController : UITableViewController <WebServiceConnectionDidFinishSignal> {
    UIActivityIndicatorView *spinner;
    UIBarButtonItem *reloadButton;
}

@property (nonatomic, strong) NSArray *beerList;
@property (nonatomic, copy) NSString *beerCategory;

@end
