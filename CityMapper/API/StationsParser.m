#import "StationsParser.h"

@implementation StationsParser

//warning: tests
+ (nullable NSArray <Station *> *)stationsFrom:(NSDictionary *)rawDict {
    NSArray *rawStations = rawDict[@"stopPoints"];
    NSMutableArray <Station *> *result = [NSMutableArray new];

    for (NSDictionary *rawStation in rawStations) {
        NSString *name = rawStation[@"commonName"];
        if (name.length > 0) {
            Station *station = [Station new];
            station.name = name;
            //get facilities from @"additionalProperties" filtering by category
            [result addObject:station];
        }
    }

    return result;
}

@end
