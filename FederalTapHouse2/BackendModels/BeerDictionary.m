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
        self.beerDictionary = [NSMutableDictionary dictionary];
        if (beerArray != nil)
            for (BeerObject *b in beerArray)
                [self addBeer:b];
    }
    
    return self;
}

/* Returns the dictionary */
- (NSDictionary *)beerDictionary {
    
    return [NSDictionary dictionaryWithDictionary:self.beerDictionary];
}

/* Returns the array of all keys */
- (NSArray *)allKeys {
    
    return [self.beerDictionary allKeys];
}

/* Add beer to the dictionary with category name as key */
- (void)addBeer:(BeerObject *)beer {
    
    NSString *category = beer.beer_category_name;
    NSArray *categoryBeerList = [self.beerDictionary objectForKey:category];
    if (categoryBeerList == nil) {
        [self.beerDictionary setObject:[NSArray arrayWithObject:beer] forKey:category];
    }
    else {
        categoryBeerList = [categoryBeerList arrayByAddingObject:beer];
        [self.beerDictionary setObject:categoryBeerList forKey:category];
    }
}

/* Returns the array of beer for given category name */
- (NSArray *)beerListForCategory:(NSString *)category {
    
    return [self.beerDictionary objectForKey:category];
}

@end
