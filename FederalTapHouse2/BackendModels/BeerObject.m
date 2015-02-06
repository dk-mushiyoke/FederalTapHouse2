//
//  BeerObject.m
//  FederalTaphouse2
//
//  Created by Di Kong on 2/4/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/**
 * Implementation of the beer object
 *
 */

#import "BeerObject.h"


@interface BeerObject()

/* Again if the float values are needed
 
 @property (nonatomic, readwrite) float beer_ABV_value;
 @property (nonatomic, readwrite) float beer_size_value;
 @property (nonatomic, readwrite) float beer_price_value;
 */
 
@end


@implementation BeerObject

/* Default constructor */
- (instancetype)init {
    self = [self initWithName:@"Sample Beer"
                     location:@""
                          abv:@""
                         size:@""
                        price:@""
                  description:@""
                     category:@"Default"
                         date:@""];
    return self;
}

/* Designated constructor with all properties */
- (instancetype)initWithName:(NSString *)n
                    location:(NSString *)l
                         abv:(NSString *)a
                        size:(NSString *)s
                       price:(NSString *)p
                 description:(NSString *)ds
                    category:(NSString *)c
                        date:(NSString *)dt
{
    self = [super init];
    
    if (self) {
        self.beer_name = n;
        self.beer_location = l;
        self.beer_ABV = a;
        self.beer_size = s;
        self.beer_price = p;
        self.beer_description = ds;
        self.beer_category_name = c;
        self.beer_date_added = dt;
        /* Can be added back if these properties are needed
         [self parseABV:a];
         [self parseSize:s];
         [self parsePrice:p];
         */
    }
    
    return self;
}

/* Returns the string when NSLogged */
- (NSString *)description {
    return [NSString stringWithFormat:
            @"\n============ Beer Info =============\n\n"
            "Beer Name: %@\n\n"
            "Beer Loacation: %@\n\n"
            "Beer ABV: %@\n\n"
            "Beer Size: %@\n\n"
            "Beer Price: %@\n\n"
            "Beer Description: %@\n\n"
            "Beer Category Name: %@\n\n"
            "Beer Date Added: %@\n\n",
            self.beer_name, self.beer_location, self.beer_ABV, self.beer_size,
            self.beer_price, self.beer_description, self.beer_category_name, self.beer_date_added];
}

/* Override KVC if parsing to number is needed
 
- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([key isEqualToString:@"beer_ABV"])
        [self parseABV:value];
    else if ([key isEqualToString:@"beer_size"])
        [self parseSize:value];
    else if ([key isEqualToString:@"beer_price"])
        [self parsePrice:value];
    [super setValue:value forKey:key];
}

- (void)parseABV:(NSString *)abvStr {
    
    NSArray *abvArray = [abvStr componentsSeparatedByString:@" "];
    if ([abvArray count] > 1)
        self.beer_ABV_value = [abvArray[1] floatValue];
}

- (void)parseSize:(NSString *)sizeStr {
    
    self.beer_size_value = [sizeStr floatValue];
}

- (void)parsePrice:(NSString *)priceStr {
    
    self.beer_price_value = [priceStr floatValue];
}
 */


@end
