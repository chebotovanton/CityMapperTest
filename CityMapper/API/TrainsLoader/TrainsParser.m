#import "TrainsParser.h"
#import "DateFormatter.h"

@implementation TrainsParser

//warning: tests
+ (nullable NSArray <Train *> *)trainsFrom:(nullable NSDictionary *)rawDict; {
    NSMutableArray <Train *> *result = [NSMutableArray new];

    for (NSDictionary *rawTrain in rawDict) {
        NSString *lineName = rawTrain[@"lineName"];
        NSString *platformName = rawTrain[@"platformName"];
        NSString *arrivalString = rawTrain[@"expectedArrival"];
        NSDate *date = [DateFormatter dateFromTflString:arrivalString];
        if (lineName.length > 0 && platformName.length > 0 && date != nil) {
            Train *train = [[Train alloc] initWithLineName:lineName platformName:platformName arrivalDate:date];
            [result addObject:train];
        }
    }

    return result;
}

@end
