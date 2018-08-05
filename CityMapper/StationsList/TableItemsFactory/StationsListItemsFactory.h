#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Station.h"
#import "Train.h"

@interface StationsListItemsFactory : NSObject

+ (nonnull NSArray <id <CollectionItemProtocol>> *)convertStations:(nonnull NSArray <Station *> *)stations
                                                            trains:(nullable NSArray <Train *> *)trains;

@end
