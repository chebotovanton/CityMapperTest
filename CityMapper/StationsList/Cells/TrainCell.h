#import <UIKit/UIKit.h>
#import "Train.h"

@interface TrainCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;
- (void)setupWith:(nonnull Train *)train;

@end
