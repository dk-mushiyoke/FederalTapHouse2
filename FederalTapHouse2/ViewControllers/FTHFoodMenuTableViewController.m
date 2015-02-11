//
//  FTHFoodCategoryTableViewController.m
//  FederalTapHouse2
//
//  Created by Di Kong on 2/11/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHFoodMenuTableViewController.h"
#import "FTHFoodDetailViewController.h"
#import "MenuDictionary.h"
#import "FoodObject.h"


@interface FTHFoodMenuTableViewController ()

@end


@implementation FTHFoodMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FoodObject *f1 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"wings"]
                                                  name:@"Boneless Wings"
                                           description:@"Description"
                                                 price:@"6.00"
                                              category:@"Appetizer"];
    FoodObject *f2 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"grilled_chicken_caesar_salad"]
                                                  name:@"Chicken Caesar Salad"
                                           description:@"Description"
                                                 price:@"3.50"
                                              category:@"Appetizer"];
    FoodObject *f3 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"steak"]
                                                  name:@"Sirloin Steak"
                                           description:@"Description"
                                                 price:@"16.00"
                                              category:@"Entree"];
    FoodObject *f4 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"turkey_breast_sandwich"]
                                                  name:@"Turkey Breast Sandwich"
                                           description:@"Description"
                                                 price:@"11.00"
                                              category:@"Entree"];
    FoodObject *f5 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"baby_back_ribs"]
                                                  name:@"Baby Back Ribs"
                                           description:@"Description"
                                                 price:@"15.00"
                                              category:@"Entree"];
    FoodObject *f6 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"strawberry_cheesecake"]
                                                  name:@"Cheese cake"
                                           description:@"Description"
                                                 price:@"4.00"
                                              category:@"Dessert"];
    FoodObject *f7 = [[FoodObject alloc] initWithImage:[UIImage imageNamed:@"hotfudge_sundae"]
                                                  name:@"Hotfudge Sundae"
                                           description:@"Description"
                                                 price:@"5.50"
                                              category:@"Dessert"];
    
    menu = [[MenuDictionary alloc] initWithFoodList:@[f1, f2, f3, f4, f5, f6, f7]];
    foodCategories = [menu allCategories];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return menu.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [menu foodListForCategory:foodCategories[section]].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *category = foodCategories[indexPath.section];
    NSArray *foodList = [menu foodListForCategory:category];
    FoodObject *food = foodList[indexPath.row];
    cell.textLabel.text = food.foodName;
    cell.textLabel.textColor = [UIColor colorWithRed:0.886f green:0.306f blue:0.129f alpha:1.0f];
    cell.contentView.backgroundColor = [UIColor cyanColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return foodCategories[section];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FTHFoodDetailViewController *dest = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    NSString *category = foodCategories[indexPath.section];
    NSArray *foodList = [menu foodListForCategory:category];
    FoodObject *food = foodList[indexPath.row];
    [dest setFood:food];
}


@end
