#import <UIKit/UIKit.h>
#import "Facility.h"

@interface FacilitiesCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;
+ (CGFloat)heightWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit;
- (void)setupWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit;

@end
