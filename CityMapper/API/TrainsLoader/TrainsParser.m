#import "TrainsParser.h"
#import "DateFormatter.h"

@implementation TrainsParser

+ (nonnull NSArray <Train *> *)trainsFrom:(nullable id)rawTrains {
    NSMutableArray <Train *> *result = [NSMutableArray new];

    if (rawTrains == nil) {
        return result;
    }

    if (![rawTrains isKindOfClass:[NSArray class]]) {
        return result;
    }

    NSArray *rawTrainsArray = (NSArray *)rawTrains;

    for (NSDictionary *rawTrain in rawTrainsArray) {
        if (![rawTrain isKindOfClass:[NSDictionary class]]) {
            continue;
        }

        NSString *lineName = rawTrain[@"lineName"];
        NSString *platformName = rawTrain[@"platformName"];
        NSString *arrivalString = rawTrain[@"expectedArrival"];

        if (![lineName isKindOfClass:[NSString class]] || ![platformName isKindOfClass:[NSString class]] || ![arrivalString isKindOfClass:[NSString class]]) {
            continue;
        }

        NSDate *date = [DateFormatter dateFromTflString:arrivalString];
        if (lineName.length > 0 && platformName.length > 0 && date != nil) {
            Train *train = [[Train alloc] initWithLineName:lineName platformName:platformName arrivalDate:date];
            [result addObject:train];
        }
    }

    return result;
}

@end
