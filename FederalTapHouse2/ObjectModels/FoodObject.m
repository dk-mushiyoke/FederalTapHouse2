//
//  FoodObject.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of food object
 *
 */

#import "FoodObject.h"


@implementation FoodObject

/* Default constructor */
- (instancetype)init {
    self = [self initWithName:@"Test food" description:@"This is a test food" price:@"1.00" category:@"Test"];
    return self;
}

/* Designated constructor with name, description, price, first category and second category */
- (instancetype)initWithName:(NSString *)name description:(NSString *)dscrptn price:(NSString *)price category:(NSString *)cat {
    
    self = [super init];
    
    if (self) {
        self.foodName = name;
        self.foodDescription = dscrptn;
        self.foodPrice = price;
        self.foodCategory = cat;
    }
    
    return self;
}

/* Returns description of class */
- (NSString *)description {
    
    return [NSString stringWithFormat:@"Food name: %@\nFood description: %@\nPrice: %@\nCategory: %@",
            self.foodName, self.foodDescription, self.foodPrice, self.foodCategory];
}

@end
