//
//  PushWithScript.h
//  FederalTapHouse2
//
//  Created by Di Kong on 3/20/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationConnectionModule : NSObject <NSURLConnectionDelegate>

@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *message;

/*- (instancetype)init;
- (instancetype)initWithDeviceToken:(NSString *)deviceToken message:(NSString *)message;
- (void)push;*/
+ (void)pushWithDeviceToken:(NSString *)deviceToken message:(NSString *)message;
+ (NSString *)pushScriptUrl;

@end
