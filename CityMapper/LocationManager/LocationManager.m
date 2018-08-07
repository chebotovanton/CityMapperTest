#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationManager() <CLLocationManagerDelegate>

@property (nonnull) CLLocationManager *clManager;

@end

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

- (id)init {
    self = [super init];

    self.clManager = [CLLocationManager new];
    self.clManager.delegate = self;

    return self;
}

- (CLLocation *)defaultLondonLocation {
    return [[CLLocation alloc] initWithLatitude:51.5102296 longitude:-0.1342989];
}

- (CLLocation *)londonCentralLocation {
    return [[CLLocation alloc] initWithLatitude:51.5287718 longitude:-0.2416808];
}

- (void)detectCurrentCoordinate {
    [self.clManager requestWhenInUseAuthorization];
}

- (BOOL)isLocationInLondon:(nullable CLLocation *)location {
    return [location distanceFromLocation:[self londonCentralLocation]] < 10000;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.clManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.clManager stopUpdatingLocation];

    CLLocation *location = locations.firstObject;
    if (![self isLocationInLondon:location]) {
        location = [self defaultLondonLocation];
    }
    NSNotification *notification = [NSNotification notificationWithName:[LocationManager coordinateNotificationName] object:location];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
