//
//  DataManager.h
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Day;

@interface DataManager : NSObject

+ (instancetype)sharedManager;
    
- (void)importDataWithCompletion:(void (^)())completion;

- (void)createWeatherDictionary:(NSArray *)days completion:(void (^)())completion;

- (Day *)dayForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)sizeOfForecast;

@end
