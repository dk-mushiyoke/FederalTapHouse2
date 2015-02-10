//
//  FTHBeerCategoryTableViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHBeerCategoryTableViewController.h"
#import "FTHBeerTableViewController.h"
#import "BeerDictionary.h"
#import "WebServiceXMLBeerParserModule.h"

@interface FTHBeerCategoryTableViewController ()

@end

@implementation FTHBeerCategoryTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadDataFromWebServer];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDataFromWebServer {
    
    // Create connection
    WebServiceConnectionModule *connection = [[WebServiceConnectionModule alloc]
                                              initWithUrl:@"http://www.softwaremerchant.com/onlinecourse.asmx"
                                              method:@"getBeerList"];
    [connection setSignalDelegate:self];
    [connection establishConnection];
    
    // Replace reload button with a spinner
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    [spinner startAnimating];
    spinner.hidesWhenStopped = YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return beerDictionary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = beerCategories[indexPath.row];
    
    return cell;
}


#pragma mark - Web Service Connection Delegate

- (void)signalFrom:(id)sender {
    
    // Create parser instance and parse
    WebServiceConnectionModule *connection = sender;
    WebServiceXMLBeerParserModule *parser = [[WebServiceXMLBeerParserModule alloc] initWithData:connection.responseData];
    [parser startParsing];
    
    // Assign parsed result to local variables
    beerDictionary = parser.beerDictionary;
    beerCategories = [beerDictionary allCategories];
    
    // Replace spinner with a reload button
    spinner = nil;
    reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(loadDataFromWebServer)];
    self.navigationItem.rightBarButtonItem = reloadButton;
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FTHBeerTableViewController *beerTable = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    NSArray *beerList = [beerDictionary beerListForCategory:beerCategories[indexPath.row]];
    NSString *beerCategory = beerCategories[indexPath.row];
    [beerTable setBeerList:beerList];
    [beerTable setBeerCategory:beerCategory];
}


@end
