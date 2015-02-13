//
//  FTHEventsTableViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHEventsTableViewController.h"
#import "EventObject.h"


@interface FTHEventsTableViewController ()

@end

@implementation FTHEventsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EventObject *e1 = [[EventObject alloc] initWithImage:[UIImage imageNamed:@"happy_hour"]
                                                    name:@"Happy Hour"
                                                    time:@"Everyday 3pm to 5pm"
                                                   place:@"Federa Taphouse"
                                             description:@"Happy hour every day! Beer 50% off!"];
    EventObject *e2 = [[EventObject alloc] initWithImage:[UIImage imageNamed:@"neeraj"]
                                                    name:@"Neeraj Mathawan Talk Show"
                                                    time:@"02/13/2015 1pm"
                                                   place:@"Software Merchant Office"
                                             description:@"Enjoy the show!"];
    EventObject *e3 = [[EventObject alloc] initWithImage:[UIImage imageNamed:@"dj"]
                                                    name:@"DJ Somedude Live"
                                                    time:@"02/30/2015 9pm"
                                                   place:@"Federa Taphouse"
                                             description:@"DJ Somedude is coming to town!"];
    EventObject *e4 = [[EventObject alloc] initWithImage:[UIImage imageNamed:@"girls_night"]
                                                    name:@"Valentine Girl's Night"
                                                    time:@"02/12/2015 All day"
                                                   place:@"Federal Taphouse"
                                             description:@"Guys pay, gals drink!"];
    eventList = @[e1, e2, e3, e4];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return eventList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *timeLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *locationLabel = (UILabel *)[cell viewWithTag:4];
    EventObject *event = eventList[indexPath.row];
    
    imageView.image = event.eventImage;
    nameLabel.text = event.eventName;
    timeLabel.text = event.eventTime;
    locationLabel.text = event.eventPlace;
    
    return cell;
}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EventObject *event = eventList[indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"\t%@", event.eventName]
                                                                   message:[NSString stringWithFormat:@"\n%@", event.eventDescription]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:event.eventImage];
    imgView.frame = CGRectMake(10, 10, 36, 36);
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [alert.view addSubview:imgView];
    UIAlertAction *dismissAlert = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {}];
    [alert addAction:dismissAlert];
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
