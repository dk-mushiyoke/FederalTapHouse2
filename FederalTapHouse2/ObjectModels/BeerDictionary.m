//
//  BeerList.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of beer list object
 *
 */

#import "BeerDictionary.h"


@implementation BeerDictionary

/* Default constructor */
- (instancetype)init {

    self = [self initWithBeers:nil];
    return self;
}

/* Designated constructor with an array of beerObjects */
- (instancetype)initWithBeers:(NSArray *)beerArray {
    
    self = [super init];
    
    if (self) {
        _beerDictionary = [NSMutableDictionary dictionary];
        if (beerArray != nil)
            for (BeerObject *b in beerArray)
                [self addBeer:b];
    }
    
    return self;
}

/* Return count of categories */
- (NSUInteger)count {
    return _beerDictionary.count;
}

/* Returns the array of all keys */
- (NSArray *)allCategories {
    
    return [_beerDictionary allKeys];
}

/* Add beer to the dictionary with category name as key */
- (void)addBeer:(BeerObject *)beer {
    
    NSString *category = beer.beer_category_name;
    NSArray *categoryBeerList = [_beerDictionary objectForKey:category];
    if (categoryBeerList == nil) {
        [_beerDictionary setObject:[NSArray arrayWithObject:beer] forKey:category];
    }
    else {
        categoryBeerList = [categoryBeerList arrayByAddingObject:beer];
        [_beerDictionary setObject:categoryBeerList forKey:category];
    }
}

/* Returns the array of beer for given category name */
- (NSArray *)beerListForCategory:(NSString *)category {
    
    return [_beerDictionary objectForKey:category];
}

@end
