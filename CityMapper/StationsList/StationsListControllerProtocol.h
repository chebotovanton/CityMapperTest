#ifndef StationsListControllerProtocol_h
#define StationsListControllerProtocol_h

#import "CollectionItemProtocol.h"

@protocol StationsListControllerProtocol

- (void)updateList:(nonnull NSArray <NSArray <id <CollectionItemProtocol>> *> *)newItems;
- (void)presentError:(nonnull NSString *)description;

@end

#endif /* StationsListControllerProtocol_h */
