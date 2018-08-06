#import <Foundation/Foundation.h>
#import "Train.h"

@interface TrainsParser : NSObject

+ (nonnull NSArray <Train *> *)trainsFrom:(nullable id)rawTrains;

@end
