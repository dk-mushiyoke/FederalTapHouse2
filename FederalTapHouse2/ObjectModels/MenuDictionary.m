//
//  MenuObject.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of menu object
 *
 */

#import "MenuDictionary.h"
#import "FoodObject.h"


@implementation MenuDictionary

/* Default constructor */
- (instancetype)init {
    
    self = [self initWithFoodList:nil];
    return self;
}

/* Designated constructor with an array of foodObjects */
- (instancetype)initWithFoodList:(NSArray *)foodList {
    
    self = [super init];
    
    if (self) {
        menuDictionary = [NSMutableDictionary dictionary];
        if (foodList)
            for (FoodObject *food in foodList)
                [self addFood:food];
    }
    
    return self;
}

/* Return count of categories */
- (NSUInteger)count {
    return menuDictionary.count;
}

/* Returns the sorted array of all categories (allKeys) */
- (NSArray *)allCategories {
    
    return [[menuDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

/* Add food to the menu with category name as key */
- (void)addFood:(FoodObject *)food {
    
    NSString *category = food.foodCategory;
    NSArray *categoryFoodList = [menuDictionary objectForKey:category];
    if (categoryFoodList == nil) {
        [menuDictionary setObject:[NSArray arrayWithObject:food] forKey:category];
    }
    else {
        categoryFoodList = [categoryFoodList arrayByAddingObject:food];
        [menuDictionary setObject:categoryFoodList forKey:category];
    }
}

/* Returns the sorted array of food for given category name (objectForKey) */
- (NSArray *)foodListForCategory:(NSString *)category {
    
    return [[menuDictionary objectForKey:category] sortedArrayUsingSelector:@selector(compare:)];
}

@end
