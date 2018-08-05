#import <Foundation/Foundation.h>
#import "TrainsLoaderDelegate.h"

@interface TrainsLoader : NSObject

@property (weak, nullable) id <TrainsLoaderDelegate> delegate;

- (void)loadTrainsForStation:(nonnull Station *)station;

@end
