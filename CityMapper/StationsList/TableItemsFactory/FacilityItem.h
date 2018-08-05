#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Facility.h"
#import "FacilitySelectionDelegate.h"

@interface FacilityItem : NSObject <CollectionItemProtocol>

- (id)initWithFacilities:(nonnull NSArray <Facility *> *)facilities delegate:(id <FacilitySelectionDelegate>)delegate;

@end
