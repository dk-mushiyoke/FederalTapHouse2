//
//  LoginViewController.m
//  FederalTapHouse2
//
//  Created by Masih Tabrizi on 2/9/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "FTHLoginViewController.h"
#import "WebServiceConnectionModule.h"
#import "WebServiceXMLLoginParserModule.h"

@interface FTHLoginViewController ()

@end

@implementation FTHLoginViewController {
    NSString *user;
    NSString *pass;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginPressed:(id)sender {
    user = [[NSString alloc]initWithString:self.usernameField.text];
    pass = [[NSString alloc]initWithString:self.passwordField.text];
    
    NSString *URL = @"http://www.softwaremerchant.com/onlinecourse.asmx";
    
    WebServiceConnectionModule *con = [[WebServiceConnectionModule alloc]initWithUrl:URL Username:user Password:pass method:@"IsUserValid"];
    
    [con establishConnection];
    [con setSignalDelegate:self];
    
}

-(void)signalFrom:(id)sender {
    
    WebServiceConnectionModule *con = sender;
    NSString *loginResult = [[NSString alloc] initWithData:con.responseData encoding:NSUTF8StringEncoding];
    [self displayMessage:loginResult];
    
    
    
}

- (void)displayMessage:(NSString*)loginResult {
    
    NSString *title;
    NSString *message;
    
    if ([loginResult isEqualToString:@"1"]) {
        title = @"Login Successful";
        message = @"Welcome to FEDERAL TAP HOUSE";
    } else {
        title = @"Login Failed";
        message = @"Incorrect Username or Password";
    }
    
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
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
