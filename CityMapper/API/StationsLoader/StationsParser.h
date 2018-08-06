#import <Foundation/Foundation.h>
#import "Station.h"

@interface StationsParser : NSObject

+ (nonnull NSArray <Station *> *)stationsFrom:(nullable id)rawDict;

@end
