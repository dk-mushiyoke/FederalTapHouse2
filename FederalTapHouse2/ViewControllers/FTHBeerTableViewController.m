//
//  FTHBeerTableViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHBeerTableViewController.h"
#import "FTHBeerDetailViewController.h"
#import "WebServiceXMLBeerParserModule.h"
#import "BeerObject.h"
#import "BeerDictionary.h"

@interface FTHBeerTableViewController ()

@end

@implementation FTHBeerTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(loadDataFromWebServer)];
    self.navigationItem.rightBarButtonItem = reloadButton;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];


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
    return self.beerList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel *categoryLabel = (UILabel *)[cell viewWithTag:1];
    BeerObject *beer = self.beerList[indexPath.row];
    categoryLabel.text = beer.beer_name;
    
    return cell;
}


#pragma mark - Web Service Connection Delegate

- (void)signalFrom:(id)sender {
    
    // Create parser instance and parse
    WebServiceConnectionModule *connection = sender;
    WebServiceXMLBeerParserModule *parser = [[WebServiceXMLBeerParserModule alloc] initWithData:connection.responseData];
    [parser startParsing];
    
    // Assign parsed result to local variables
    self.beerList = [parser.beerDictionary beerListForCategory:self.beerCategory];
    
    // Replace spinner with a reload button
    spinner = nil;
    reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(loadDataFromWebServer)];
    self.navigationItem.rightBarButtonItem = reloadButton;
    [self.tableView reloadData];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    FTHBeerDetailViewController *dest = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    BeerObject *beer = self.beerList[indexPath.row];
    [dest setBeer:beer];
}


@end
