#import <UIKit/UIKit.h>
#import "Station.h"

@interface StationCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;
- (void)setupWith:(nonnull Station *)station;

@end
