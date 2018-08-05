#import <Foundation/Foundation.h>
#import "Train.h"

@interface TrainsSorter : NSObject

+ (nonnull NSArray <Train *> *)sortedTrainsByArrivingTime:(nonnull NSArray <Train *> *)trains;

@end
