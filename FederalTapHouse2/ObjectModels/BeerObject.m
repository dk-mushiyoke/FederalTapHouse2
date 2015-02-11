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


@implementation BeerObject

/* Default constructor */
- (instancetype)init {
    self = [self initWithImage:nil
                          name:@"Test Beer"
                      location:@"Nowheresville"
                           abv:@"ABV 0.0"
                          size:@"1OZ"
                         price:@"1.00000"
                   description:@"This is a test beer"
                      category:@"Test"
                          date:@"Just now"];
    return self;
}

/* Designated constructor with all properties */
- (instancetype)initWithImage:(UIImage *)i
                         name:(NSString *)n
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
        self.beer_image = i;
        self.beer_name = n;
        self.beer_location = l;
        self.beer_ABV = a;
        self.beer_size = s;
        self.beer_price = p;
        self.beer_description = ds;
        self.beer_category_name = c;
        self.beer_date_added = dt;
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
            "Beer Price: %.2f\n\n"
            "Beer Description: %@\n\n"
            "Beer Category Name: %@\n\n"
            "Beer Date Added: %@\n\n",
            self.beer_name, self.beer_location, self.beer_ABV, self.beer_size,
            self.beer_price_value, self.beer_description, self.beer_category_name, self.beer_date_added];
}

/* Returns the float value of price */
- (float)beer_price_value {
    return [self.beer_price floatValue];
}

/* Returns a comparison result between beer names */
- (NSComparisonResult)compare:(BeerObject *)beer {

    return [self.beer_name compare:beer.beer_name];
}

@end
