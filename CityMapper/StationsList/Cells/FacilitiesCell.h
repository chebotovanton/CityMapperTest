#import <UIKit/UIKit.h>
#import "Facility.h"

@interface FacilitiesCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;
- (void)setupWith:(nonnull NSArray <Facility *> *)facilities;

@end
