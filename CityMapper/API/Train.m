#import "Train.h"

@implementation Train

- (id)initWithLineName:(NSString *)lineName platformName:(NSString *)platformName arrivalDate:(NSDate *)arrivalDate {
    self = [super init];

    self.lineName = lineName;
    self.platformName = platformName;
    self.arrivalDate = arrivalDate;

    return self;
}

@end
