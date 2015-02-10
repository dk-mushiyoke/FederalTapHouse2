//
//  FTHLogInViewController.h
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/9/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServiceConnectionModule.h"

@interface LoginViewController : UIViewController <WebServiceConnectionDidFinishSignal>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginPressed:(id)sender;

@end
