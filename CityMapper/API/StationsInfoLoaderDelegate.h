#import "Station.h"

#ifndef StationsInfoLoaderDelegate_h
#define StationsInfoLoaderDelegate_h

@protocol StationsInfoLoaderDelegate <NSObject>

- (void)didLoadStations:(NSArray <Station *> *)stations;

@end

#endif /* StationsInfoLoaderDelegate_h */
