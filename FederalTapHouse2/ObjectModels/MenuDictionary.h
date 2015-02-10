//
//  MenuObject.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This class models the menu object
 *
 */

#import <Foundation/Foundation.h>


@class FoodObject;

@interface MenuDictionary : NSObject {
    NSMutableDictionary *menuDictionary;
}

- (instancetype)init;
- (instancetype)initWithFoodList:(NSArray *)foodList;
- (NSArray *)allCategories;
- (NSUInteger)count;
- (void)addFood:(FoodObject *)food;
- (NSArray *)foodListForCategory:(NSString *)category;


@end
