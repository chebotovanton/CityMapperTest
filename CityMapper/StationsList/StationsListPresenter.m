#import "StationsListPresenter.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationManager.h"
#import "StationsInfoLoader.h"
#import "StationsListItemsFactory.h"
#import "TrainsLoader.h"
#import "TrainsSorter.h"

@interface StationsListPresenter () <StationsInfoLoaderDelegate, TrainsLoaderDelegate, FacilitySelectionDelegate>

@property (nullable) StationsInfoLoader *stationsInfoLoader;
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
    for (Station *station in self.stations) {
        [self loadTrainsForStation:station];
    }
}

- (void)loadTrainsForStation:(nonnull Station *)station {
    TrainsLoader *trainsLoader = [TrainsLoader new];
    trainsLoader.delegate = self;
    [trainsLoader loadTrainsForStation:station];
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
    NSArray <NSArray <id <CollectionItemProtocol>> *> * items = [StationsListItemsFactory convertStations:stations delegate:self];
    [self.viewController updateList:items];
    [self startLoadingTrains];
}

- (void)didFailLoadingStations
{
    [self.viewController presentError:@"Could not load stations. Try use VPN"];
}

#pragma mark - TrainsLoaderDelegate

- (void)didLoadTrains:(NSArray<Train *> *)trains forStation:(Station *)station {
    NSArray<Train *> *sortedTrains = [TrainsSorter sortedTrainsByArrivingTime:trains];
    NSRange range = NSMakeRange(0, MIN(3, trains.count));
    station.arrivingTrains = [sortedTrains subarrayWithRange:range];
    NSArray <NSArray <id <CollectionItemProtocol>> *> *items = [StationsListItemsFactory convertStations:self.stations delegate:self];
    [self.viewController updateList:items];

    __weak StationsListPresenter *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf loadTrainsForStation:station];
    });
}

#pragma mark -

- (void)didSelectFacility:(nonnull Facility *)facility {
    UIViewController *facilityVC = [UIViewController new];
    facilityVC.title = facility.name;
    facilityVC.view.backgroundColor = [UIColor whiteColor];
    [self.viewController.navigationController pushViewController:facilityVC animated:YES];
}

@end
