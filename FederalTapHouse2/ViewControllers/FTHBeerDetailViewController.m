//
//  FTHBeerDetailViewController.m
//  FederalTapHouse2
//
//  Created by Merritt Tidwell on 2/8/15.
//  Copyright (c) 2015 Software Merchant. All rights reserved.
//

#import <Social/Social.h>
#import "FTHBeerDetailViewController.h"
#import "BeerObject.h"

@interface FTHBeerDetailViewController ()

@end

@implementation FTHBeerDetailViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_with_watermark"]];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSString *beerSnA = [NSString stringWithFormat:@"Size: %@\n%@", self.beer.beer_size, self.beer.beer_ABV];
    NSString *beerP = [NSString stringWithFormat:@"Price: $%.2f", self.beer.beer_price_value];
    self.beerImage.image = self.beer.beer_image;
    self.beerName.text = self.beer.beer_name;
    self.beerSizeAndABV.text = beerSnA;
    self.beerPrice.text = beerP;
    self.beerDescription.text = self.beer.beer_description;
    NSLog(@"%@", self.beer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shareTapped:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:[NSString stringWithFormat:@"Hey guys I just tried an awesome beer called %@ at Federal TapHouse. You should try it! Cheers...", self.beer.beer_name]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure"
                                  "your device has an internet connection and you have"
                                  "at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
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
