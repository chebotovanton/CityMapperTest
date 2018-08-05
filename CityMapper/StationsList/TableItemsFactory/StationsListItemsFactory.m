#import "StationsListItemsFactory.h"
#import "StationItem.h"
#import "FacilityItem.h"
#import "TrainItem.h"

@implementation StationsListItemsFactory

+ (nonnull NSArray <id <CollectionItemProtocol>> *)convertStations:(NSArray <Station *> *)stations
                                                            trains:(NSArray *)trains {

    //warning: tests!

    NSMutableArray *result = [NSMutableArray new];
    for (Station *station in stations) {
        [result addObject:[[StationItem alloc] initWithStation:station]];
        NSArray *facilities = station.facilities;
        if (facilities.count > 0) {
            [result addObject:[[FacilityItem alloc] initWithFacilities:facilities]];
        }
        for (Train *train in trains) {
            [result addObject:[[TrainItem alloc] initWithTrain:train]];
        }
    }

    return result;
}

@end
