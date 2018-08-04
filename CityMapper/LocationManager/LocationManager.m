#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocationManager

static LocationManager *sharedManager;

+ (LocationManager *)shared {
    if (!sharedManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedManager = [LocationManager new];
        });
    }

    return sharedManager;
}

+ (nonnull NSString *)coordinateNotificationName {
    return @"locationUpdated";
}

- (void)detectCurrentCoordinate {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:51.5102296 longitude:-0.1342989];

    NSNotification *notification = [NSNotification notificationWithName:[LocationManager coordinateNotificationName] object:location];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
