#import <Foundation/Foundation.h>
#import "Station.h"

@interface StationsParser : NSObject

+ (nullable NSArray <Station *> *)stationsFrom:(nullable NSDictionary *)rawDict;

@end
