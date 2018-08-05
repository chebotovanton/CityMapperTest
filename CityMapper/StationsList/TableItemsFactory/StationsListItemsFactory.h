#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Station.h"
#import "Train.h"
#import "FacilitySelectionDelegate.h"

@interface StationsListItemsFactory : NSObject

+ (nonnull NSArray <NSArray <id <CollectionItemProtocol>> *> *)convertStations:(nonnull NSArray <Station *> *)stations
                                                                      delegate:(id <FacilitySelectionDelegate>)delegate;

@end
