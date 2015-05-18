//
//  DataManager.m
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "DataManager.h"
#import <AFNetworking.h>
#import "Day.h"

static NSString *const weatherURL = @"http://api.openweathermap.org/data/2.5/forecast/daily?lat=-37.96914&lon=145.05542&units=metric&cnt=10&mode=json";

@interface DataManager()

@property (nonatomic, strong) NSMutableArray *forecastArray;

@end

@implementation DataManager

+ (instancetype)sharedManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DataManager alloc] init];
    });
    
    return _sharedInstance;
}

- (void)importDataWithCompletion:(void (^)())completion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:weatherURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self createWeatherDictionary:(NSArray *)responseObject[@"list"] completion:completion];
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

- (void)createWeatherDictionary:(NSArray *)days completion:(void (^)())completion {
    self.forecastArray = [NSMutableArray array];
    
    for (int i=0; i<days.count; i++) {
        Day* nextDay = [Day new];
        NSDictionary *day = days[i];
        
        NSNumber *timeSince1970 = day[@"dt"];
        NSTimeInterval interval = timeSince1970.doubleValue;
        nextDay.date = [NSDate dateWithTimeIntervalSince1970:interval];
        
        NSDictionary *temp = day[@"temp"];
        nextDay.day = temp[@"day"];
        nextDay.min = temp[@"min"];
        nextDay.max = temp[@"max"];
        nextDay.night = temp[@"night"];
        nextDay.evening = temp[@"eve"];
        nextDay.morning = temp[@"morn"];
        
        nextDay.weatherDescription = day[@"weather"][0][@"description"];
        nextDay.humidity    = day[@"humidity"];
        nextDay.rain        = day[@"rain"];
        
        self.forecastArray[i] = nextDay;
    }
    
    completion();
}

- (Day *)dayForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.forecastArray[indexPath.row];
}

- (NSInteger)sizeOfForecast {
    return self.forecastArray.count;
}

@end
