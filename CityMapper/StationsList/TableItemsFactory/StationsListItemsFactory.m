#import "StationsListItemsFactory.h"
#import "StationItem.h"
#import "FacilityItem.h"
#import "TrainItem.h"

@implementation StationsListItemsFactory

+ (nonnull NSArray <NSArray <id <CollectionItemProtocol>> *> *)convertStations:(nonnull NSArray <Station *> *)stations
                                                                      delegate:(id <FacilitySelectionDelegate>)delegate {

    //warning: It's worth adding tests here
    NSMutableArray *result = [NSMutableArray new];

    for (Station *station in stations) {
        NSMutableArray *stationItems = [NSMutableArray new];
        [stationItems addObject:[[StationItem alloc] initWithStation:station]];
        NSArray *facilities = station.facilities;
        if (facilities.count > 0) {
            [stationItems addObject:[[FacilityItem alloc] initWithFacilities:facilities delegate:delegate]];
        }
        for (Train *train in station.arrivingTrains) {
            [stationItems addObject:[[TrainItem alloc] initWithTrain:train]];
        }

        [result addObject:stationItems];
    }

    return result;
}

@end
