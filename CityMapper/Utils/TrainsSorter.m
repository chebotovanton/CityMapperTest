#import "TrainsSorter.h"

@implementation TrainsSorter

+ (nonnull NSArray <Train *> *)sortedTrainsByArrivingTime:(nonnull NSArray <Train *> *)trains {
    return [trains sortedArrayUsingComparator:^NSComparisonResult(Train  * _Nonnull train1, Train * _Nonnull train2) {
        return [train1.arrivalDate compare:train2.arrivalDate];
    }];
}

@end
