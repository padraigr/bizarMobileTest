//
//  ViewController.m
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator startAnimating];
    [self.view addSubview:activityIndicator];
    
    void(^completion)() = ^() {
        // Retrieve all products and reload the table data.
        [activityIndicator stopAnimating];
        [activityIndicator removeFromSuperview];
        [self performSegueWithIdentifier:@"Loaded" sender:self];
    };
    
    [[DataManager sharedManager] importDataWithCompletion:^{
        completion();
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
