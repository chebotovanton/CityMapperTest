#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Station.h"

@interface StationsListItemsFactory : NSObject

//warning: mark trains Class explicitly
+ (nonnull NSArray <id <CollectionItemProtocol>> *)convertStations:(NSArray <Station *> *)stations
                                                            trains:(NSArray *)trains;

@end
