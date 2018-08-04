#import "StationsListPresenter.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationManager.h"
#import "StationsInfoLoader.h"
#import "StationsListItemsFactory.h"

@interface StationsListPresenter () <StationsInfoLoaderDelegate>

@property StationsInfoLoader *stationsInfoLoader;

@end

@implementation StationsListPresenter

- (void)getNearbyStations {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(coordinateUpdated:)
                                                 name:[LocationManager coordinateNotificationName]
                                               object:nil];

    [[LocationManager shared] detectCurrentCoordinate];
}

- (void)coordinateUpdated:(NSNotification *)notification {
    if ([notification.object isKindOfClass:[CLLocation class]]) {
        CLLocation *location = (CLLocation *)notification.object;
        self.stationsInfoLoader = [StationsInfoLoader new];
        self.stationsInfoLoader.delegate = self;

        [self.stationsInfoLoader loadStationsWithLat:location.coordinate.latitude lon:location.coordinate.longitude];

    }
}

#pragma mark - StationsInfoLoaderDelegate

- (void)didLoadStations:(NSArray <Station *> *)stations {
    NSArray <id <CollectionItemProtocol>> *items = [StationsListItemsFactory convertStations:stations trains:@[]];

    [self.viewController updateList:items];
}

@end
