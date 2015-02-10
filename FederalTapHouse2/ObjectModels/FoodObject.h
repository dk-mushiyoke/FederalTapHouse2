//
//  FoodObject.h
//  FederalTapHouse2
//
//  Created by Di Kong on 2/6/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * This class models the food items on menu
 *
 */

#import <Foundation/Foundation.h>

@interface FoodObject : NSObject

@property (nonatomic, copy) NSString *foodName;
@property (nonatomic, copy) NSString *foodDescription;
@property (nonatomic, copy) NSString *foodPrice;
@property (nonatomic, copy) NSString *foodFirstCategory;
@property (nonatomic, copy) NSString *foodSecondCategory;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name description:(NSString *) price: firstCategory: secondCategory:

@end
