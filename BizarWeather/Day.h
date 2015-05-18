//
//  Day.h
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Day : NSObject

@property (nonatomic, strong) NSDate   *date;
@property (nonatomic, strong) NSNumber *day;
@property (nonatomic, strong) NSNumber *min;
@property (nonatomic, strong) NSNumber *max;
@property (nonatomic, strong) NSNumber *night;
@property (nonatomic, strong) NSNumber *evening;
@property (nonatomic, strong) NSNumber *morning;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) NSNumber *rain;
@property (nonatomic, strong) NSNumber *humidity;

@end
