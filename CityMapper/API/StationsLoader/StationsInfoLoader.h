#import <Foundation/Foundation.h>
#import "StationsInfoLoaderDelegate.h"

@interface StationsInfoLoader : NSObject

@property (weak, nullable) id <StationsInfoLoaderDelegate> delegate;

- (void)loadStationsWithLat:(double)latitude lon:(double)longitude;

@end
