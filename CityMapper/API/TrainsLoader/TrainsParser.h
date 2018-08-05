#import <Foundation/Foundation.h>
#import "Train.h"

@interface TrainsParser : NSObject

+ (nullable NSArray <Train *> *)trainsFrom:(nullable NSDictionary *)rawDict;

@end
