//
//  BeerList.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This class models the list of beers
 *
 */

#import <Foundation/Foundation.h>
#import "BeerObject.h"


@interface BeerDictionary : NSObject

@property (nonatomic, strong) NSMutableDictionary *beerDictionary;

- (instancetype)init;
- (instancetype)initWithBeers:(NSArray *)beerArray;
- (NSArray *)allCategories;
- (NSUInteger)count;
- (void)addBeer:(BeerObject *)beer;
- (NSArray *)beerListForCategory:(NSString *)category;

@end
