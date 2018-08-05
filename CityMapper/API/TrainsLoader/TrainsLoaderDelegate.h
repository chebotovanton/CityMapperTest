#ifndef TrainsLoaderDelegate_h
#define TrainsLoaderDelegate_h

#import "Station.h"
#import "Train.h"

@protocol TrainsLoaderDelegate <NSObject>

- (void)didLoadTrains:(nonnull NSArray <Train *> *)trains forStation:(nonnull Station *)station;

@end

#endif /* TrainsLoaderDelegate_h */
