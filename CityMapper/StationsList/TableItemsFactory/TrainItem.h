#import <Foundation/Foundation.h>
#import "CollectionItemProtocol.h"
#import "Train.h"

@interface TrainItem : NSObject <CollectionItemProtocol>

- (id)initWithTrain:(nonnull Train *)train;

@end
