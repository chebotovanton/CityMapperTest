#import "StationsListItemsFactory.h"
#import "StationItem.h"

@implementation StationsListItemsFactory

+ (nonnull NSArray <id <CollectionItemProtocol>> *)convertStations:(NSArray <Station *> *)stations
                 trains:(NSArray *)trains {

    //warning: tests!

    NSMutableArray *result = [NSMutableArray new];
    for (Station *station in stations) {
        [result addObject:[[StationItem alloc] initWithStation:station]];
    }

    return result;
}

@end
