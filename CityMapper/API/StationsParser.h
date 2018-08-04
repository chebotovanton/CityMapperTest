#import <Foundation/Foundation.h>
#import "Station.h"

@interface StationsParser : NSObject

+ (nullable NSArray <Station *> *)stationsFrom:(NSDictionary *)rawDict;

@end
