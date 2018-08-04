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
            NSArray *properties = rawStation[@"additionalProperties"];
            station.facilities = [self facilitiesFrom:properties];
            [result addObject:station];
        }
    }

    return result;
}

+ (nonnull NSArray <Facility *> *)facilitiesFrom:(nullable NSArray *)rawProperties {
    //tests
    //warning: filter with predicate
    NSMutableArray <Facility *> *result = [NSMutableArray new];
    for (NSDictionary * rawProperty in rawProperties) {
        NSString *category = rawProperty[@"category"];
        if ([category isEqualToString:@"Facility"]) {
            NSString *name = rawProperty[@"key"];
            Facility *facility = [Facility new];
            facility.name = name;
            [result addObject:facility];
        }
    }

    return result;
}

@end
