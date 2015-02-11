//
//  BeerObject.h
//  FederalTaphouse2
//
//  Created by Di Kong on 2/4/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

/** 
 * This class models the beer object
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BeerObject : NSObject

@property (nonatomic, strong) UIImage *beer_image;
@property (nonatomic, copy)  NSString *beer_name;
@property (nonatomic, copy)  NSString *beer_location;
@property (nonatomic, copy)  NSString *beer_ABV;
@property (nonatomic, copy)  NSString *beer_size;
@property (nonatomic, copy)  NSString *beer_price;
@property (nonatomic, readonly) float beer_price_value;
@property (nonatomic, copy)  NSString *beer_description;
@property (nonatomic, copy)  NSString *beer_category_name;
@property (nonatomic, copy)  NSString *beer_date_added;


- (instancetype)init;
- (instancetype)initWithImage:(UIImage *)i
                         name:(NSString *)n
                    location:(NSString *)l
                         abv:(NSString *)a
                        size:(NSString *)s
                       price:(NSString *)p
                 description:(NSString *)ds
                    category:(NSString *)c
                        date:(NSString *)dt;
- (NSComparisonResult)compare:(BeerObject *)beer;

@end
