#import <Foundation/Foundation.h>
#import "StationsListControllerProtocol.h"

@interface StationsListPresenter : NSObject

@property (nullable, weak) id <StationsListControllerProtocol> viewController;

- (void)getNearbyStations;

@end
