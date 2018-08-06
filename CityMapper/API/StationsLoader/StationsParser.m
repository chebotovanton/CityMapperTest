#import "StationsParser.h"

@implementation StationsParser

+ (nonnull NSArray <Station *> *)stationsFrom:(nullable id)rawDict {
    NSMutableArray <Station *> *result = [NSMutableArray new];

    if (rawDict == nil) {
        return result;
    }
    if (![rawDict isKindOfClass:[NSDictionary class]]) {
        return result;
    }

    NSArray *rawStations = rawDict[@"stopPoints"];
    if (![rawStations isKindOfClass:[NSArray class]]) {
        return result;
    }

    for (NSDictionary *rawStation in rawStations) {
        if (![rawStation isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        NSString *name = rawStation[@"commonName"];
        NSString *stationId = rawStation[@"naptanId"];
        if (![name isKindOfClass:[NSString class]] || ![stationId isKindOfClass:[NSString class]]) {
            continue;
        }
        if (name.length > 0 && stationId.length > 0) {
            Station *station = [[Station alloc] initWithName:name id:stationId];
            id properties = rawStation[@"additionalProperties"];
            station.facilities = [self facilitiesFrom:properties];
            [result addObject:station];
        }
    }

    return result;
}

+ (nonnull NSArray <Facility *> *)facilitiesFrom:(nullable id)rawProperties {
    //warning: filter with predicate
    NSMutableArray <Facility *> *result = [NSMutableArray new];
    if (![rawProperties isKindOfClass:[NSArray class]]) {
        return result;
    }

    for (NSDictionary * rawProperty in rawProperties) {
        if (![rawProperty isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        NSString *category = rawProperty[@"category"];
        NSString *name = rawProperty[@"key"];
        if ([category isEqualToString:@"Facility"] && [name isKindOfClass:[NSString class]]) {
            Facility *facility = [Facility new];
            facility.name = name;
            [result addObject:facility];
        }
    }

    return result;
}

@end
