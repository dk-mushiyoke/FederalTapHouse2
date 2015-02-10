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

    self = [self initWithBeerList:nil];
    return self;
}

/* Designated constructor with an array of beerObjects */
- (instancetype)initWithBeerList:(NSArray *)beerList {
    
    self = [super init];
    
    if (self) {
        beerDictionary = [NSMutableDictionary dictionary];
        if (beerList)
            for (BeerObject *b in beerList)
                [self addBeer:b];
    }
    
    return self;
}

/* Return count of categories */
- (NSUInteger)count {
    return beerDictionary.count;
}

/* Returns the sorted array of all categories (allKeys) */
- (NSArray *)allCategories {
    
    return [[beerDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

/* Add beer to the dictionary with category name as key */
- (void)addBeer:(BeerObject *)beer {
    
    NSString *category = beer.beer_category_name;
    NSArray *categoryBeerList = [beerDictionary objectForKey:category];
    if (categoryBeerList == nil) {
        [beerDictionary setObject:[NSArray arrayWithObject:beer] forKey:category];
    }
    else {
        categoryBeerList = [categoryBeerList arrayByAddingObject:beer];
        [beerDictionary setObject:categoryBeerList forKey:category];
    }
}

/* Returns the sorted array of beer for given category name (objectForKey) */
- (NSArray *)beerListForCategory:(NSString *)category {
    
    return [[beerDictionary objectForKey:category] sortedArrayUsingSelector:@selector(compare:)];
}

@end
