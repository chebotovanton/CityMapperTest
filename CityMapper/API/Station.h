#import <Foundation/Foundation.h>
#import "Facility.h"

@interface Station : NSObject

@property (nonnull) NSString *name;
@property (nonnull) NSString *stationId;
@property NSArray <Facility *> *facilities;

- (id)initWithName:(nonnull NSString *)name id:(nonnull NSString *)stationId;

@end
