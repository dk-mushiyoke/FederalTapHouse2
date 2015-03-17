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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_with_watermark"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard:(id)sender {

    [self.view endEditing:YES];
}

-(void)loginPressed:(id)sender {
    user = [[NSString alloc]initWithString:self.usernameField.text];
    pass = [[NSString alloc]initWithString:self.passwordField.text];
    
    NSString *URL = @"http://www.softwaremerchant.com/onlinecourse.asmx";
    
    WebServiceConnectionModule *con = [[WebServiceConnectionModule alloc]initWithUrl:URL Username:user Password:pass method:@"IsUserValid"];
    
    [con establishConnection];
    [con setSignalDelegate:self];
    
}

-(void)connectionDidFinishSignalFrom:(id)sender {
    
    WebServiceConnectionModule *con = sender;
    WebServiceXMLLoginParserModule *par = [[WebServiceXMLLoginParserModule alloc] initWithData:con.responseData];
    [par startParsing];
    [self displayMessage:par.loginResult];
    
    
    
}

- (void)displayMessage:(NSString*)loginResult {
    
    NSString *title;
    NSString *message;
    
    if ([loginResult isEqualToString:@"1"]) {
        title = @"Login Successful";
        message = @"Welcome to Federal Tap House";
        [self performSegueWithIdentifier:@"showMenu" sender:self];
    } else {
        title =[NSString stringWithFormat:@"Login Failed"];
        message = @"Incorrect Username or Password";
    }
    
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

@end
