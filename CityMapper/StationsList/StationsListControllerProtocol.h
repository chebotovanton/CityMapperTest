#ifndef StationsListControllerProtocol_h
#define StationsListControllerProtocol_h

#import "CollectionItemProtocol.h"

@protocol StationsListControllerProtocol

- (void)updateList:(NSArray <id <CollectionItemProtocol>> *)newItems;

@end

#endif /* StationsListControllerProtocol_h */
