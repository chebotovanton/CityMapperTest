#import <Foundation/Foundation.h>
#import "Facility.h"
#import "Train.h"

@interface Station : NSObject

@property (nonnull) NSString *name;
@property (nonnull) NSString *stationId;
@property NSArray <Facility *> *facilities;
@property (nullable) NSArray <Train *> *arrivingTrains;

- (id)initWithName:(nonnull NSString *)name id:(nonnull NSString *)stationId;

@end
