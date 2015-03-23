//
//  PushWithScript.m
//  FederalTapHouse2
//
//  Created by Di Kong on 3/20/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import "NotificationConnectionModule.h"

@interface NotificationConnectionModule ()

@property (nonatomic) NSURL *pushScript;


@end

@implementation NotificationConnectionModule

- (instancetype)init {

    self = [self initWithDeviceToken:@"" message:@""];
    return self;
}

- (instancetype)initWithDeviceToken:(NSString *)deviceToken message:(NSString *)message {

    self = [super init];
    if (self) {
        self.deviceToken = deviceToken;
        self.message = message;
        NSString *unescapedUrl = [NSString stringWithFormat:@"%@?deviceToken=%@&message=%@",
                                  [NotificationConnectionModule pushScriptUrl], self.deviceToken, self.message];
        NSString *escapedUrl = [unescapedUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        self.pushScript = [NSURL URLWithString:escapedUrl];
    }
    return self;
}

- (void)push {

    if (self.deviceToken == nil || self.message == nil) {
        NSLog(@"nothing to push");
        return;
    }
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.pushScript];
    [request setHTTPMethod:@"POST"];
    /*[request setURL:self.pushScript];*/
    
    /*NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];*/
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:/*backgroundQueue*/[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   NSLog(@"connection to push server error: %@", connectionError.localizedDescription);
                               }
                               else if (data.length > 0){
                                   NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"result = %@", result);
                               }
                               else {
                                   NSLog(@"nothing downloaded");
                               }
                           }];
    /*NSURLResponse *response = nil;
    NSError *error;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"response = %@", response);*/
}

+ (void)pushWithDeviceToken:(NSString *)deviceToken message:(NSString *)message {
    
    NotificationConnectionModule *thePusher = [[NotificationConnectionModule alloc] initWithDeviceToken:deviceToken message:message];
    [thePusher push];
}

+ (NSString *)pushScriptUrl {

    static NSString *url;
    if (url == nil) {
        url = @"http://www.softwaremerchant.com/pushnotification/simplepush.php";
    }
    return url;
}

@end
