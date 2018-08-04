#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Facility.h"

@interface FacilityItem : NSObject <CollectionItemProtocol>

- (id)initWithFacilities:(nonnull NSArray <Facility *> *)facilities;

@end
