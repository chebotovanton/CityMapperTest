#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Station.h"

@interface StationItem : NSObject <CollectionItemProtocol>

- (id)initWithStation:(nonnull Station *)station;

@end
