//
//  WeatherTableViewCell.h
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Day;

@interface WeatherTableViewCell : UITableViewCell

- (void)configureWithDay:(Day *)day;
    
@end
