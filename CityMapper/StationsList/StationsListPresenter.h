#import <Foundation/Foundation.h>
#import "StationsListControllerProtocol.h"

@interface StationsListPresenter : NSObject

@property (nullable, weak) UIViewController <StationsListControllerProtocol> * viewController;

- (void)getNearbyStations;

@end
