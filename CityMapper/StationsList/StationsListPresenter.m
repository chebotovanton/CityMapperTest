#import "StationsListPresenter.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationManager.h"
#import "StationsInfoLoader.h"
#import "StationsListItemsFactory.h"
#import "TrainsLoader.h"

@interface StationsListPresenter () <StationsInfoLoaderDelegate, TrainsLoaderDelegate>

@property (nullable) StationsInfoLoader *stationsInfoLoader;
@property (nullable) TrainsLoader *trainsLoader;
@property (nullable) NSArray <Station *> *stations;

@end

@implementation StationsListPresenter

- (void)getNearbyStations {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(coordinateUpdated:)
                                                 name:[LocationManager coordinateNotificationName]
                                               object:nil];

    [[LocationManager shared] detectCurrentCoordinate];
}

- (void)startLoadingTrains {
    Station *station = self.stations.firstObject;
    self.trainsLoader = [TrainsLoader new];
    self.trainsLoader.delegate = self;
    [self.trainsLoader loadTrainsForStation:station];
}

#pragma mark - Location Notification

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
    self.stations = stations;
    NSArray <id <CollectionItemProtocol>> *items = [StationsListItemsFactory convertStations:stations trains:@[]];
    [self.viewController updateList:items];
    [self startLoadingTrains];
}

- (void)didFailLoadingStations
{
    [self.viewController presentError:@"Could not load stations. Try use VPN"];
}

#pragma mark - TrainsLoaderDelegate

- (void)didLoadTrains:(NSArray<Train *> *)trains forStation:(Station *)station {
    NSArray <id <CollectionItemProtocol>> *items = [StationsListItemsFactory convertStations:self.stations trains:trains];
    [self.viewController updateList:items];
}

@end
