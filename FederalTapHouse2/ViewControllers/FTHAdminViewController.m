//
//  adminViewController.m
//  FederalTapHouse2
//
//  Created by Masih Tabrizi on 3/20/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHAdminViewController.h"
#import "WebServiceConnectionModule.h"
#import "WebServiceXMLDeviceTokenParserModule.h"
#import "NotificationConnectionModule.h"

@interface FTHAdminViewController () <WebServiceConnectionDidFinishSignal>

@end

@implementation FTHAdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendNotifications {
    
    WebServiceConnectionModule *con = [[WebServiceConnectionModule alloc] initWithUrl:@"http://www.softwaremerchant.com/onlinecourse.asmx" method:@"getAllDeviceTokens"];
    [con setSignalDelegate:self];
    [con establishConnection];
}


#pragma mark - Web Service Connection

- (void)connectionDidFinishSignalFrom:(id)sender {
    
    WebServiceConnectionModule *con = sender;
    WebServiceXMLDeviceTokenParserModule *parser = [[WebServiceXMLDeviceTokenParserModule alloc] initWithData:con.responseData];
    [parser startParsing];
    NSDictionary *userTokenDict = parser.userTokenDictionary;
    for (NSString *user in userTokenDict.allKeys) {
        NSString *token = userTokenDict[user];
        /*NSString *msg = [NSString stringWithFormat:@"test push to %@", user];*/
        NSLog(@"user = %@ token = %@", user, token);
        [NotificationConnectionModule pushWithDeviceToken:token message:self.notificationTextView.text];
    }
    
    /*NSString *deviceToken = @"64072e43da76e9ccf942414176f8f8d02c7bed28488070460a296dc3ab446dce";
     NSString *message = @"Hello world from push test";*/
    
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
