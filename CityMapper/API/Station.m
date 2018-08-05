#import "Station.h"

@implementation Station

- (id)initWithName:(nonnull NSString *)name id:(nonnull NSString *)stationId {
    self = [super init];

    self.name = name;
    self.stationId = stationId;

    return self;
}

@end
