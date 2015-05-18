//
//  WeatherTableViewController.m
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "WeatherTableViewCell.h"
#import "DataManager.h"
#import "Day.h"

@interface WeatherTableViewController ()

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refreshData)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)refreshData {
    void(^completion)() = ^() {
       [self.tableView reloadData];
       [self.refreshControl endRefreshing];
    };
    [[DataManager sharedManager] importDataWithCompletion:completion];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Day *day = [[DataManager sharedManager] dayForRowAtIndexPath:indexPath];
    [(WeatherTableViewCell *)cell configureWithDay:day];
    return cell;
}

@end
