#import <Foundation/Foundation.h>
#import "Facility.h"

@interface Station : NSObject

@property (nonnull) NSString *name;
@property NSArray <Facility *> *facilities;

@end
