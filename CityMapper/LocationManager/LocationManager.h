#import <Foundation/Foundation.h>

@interface LocationManager : NSObject

+ (nonnull LocationManager *)shared;
+ (nonnull NSString *)coordinateNotificationName;
- (void)detectCurrentCoordinate;

@end
