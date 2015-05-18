//
//  WeatherTableViewCell.m
//  BizarWeather
//
//  Created by Padraig John Robinson on 18/05/2015.
//  Copyright (c) 2015 Outworld Designs. All rights reserved.
//

#import "WeatherTableViewCell.h"
#import "Day.h"

@interface WeatherTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *ibDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *ibMinTemp;
@property (weak, nonatomic) IBOutlet UILabel *ibMaxTemp;
@property (weak, nonatomic) IBOutlet UILabel *ibNightTemp;
@property (weak, nonatomic) IBOutlet UILabel *ibRainLabel;

@end

@implementation WeatherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithDay:(Day *)day {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dayName = [dateFormatter stringFromDate:day.date];
    self.ibDayLabel.text    = dayName;
    self.ibMinTemp.text     = [NSString stringWithFormat:@"Min: %ld°C", (long)[day.min integerValue]];
    self.ibMaxTemp.text     = [NSString stringWithFormat:@"Max: %ld°C", (long)[day.max integerValue]];
    self.ibNightTemp.text   = [NSString stringWithFormat:@"%ld°C", (long)[day.night integerValue]];
    if (day.rain) {
        self.ibRainLabel.text   = [NSString stringWithFormat:@"%@mm", day.rain];
    } else {
        self.ibRainLabel.text   = [NSString stringWithFormat:@"None"];
    }
}

@end
