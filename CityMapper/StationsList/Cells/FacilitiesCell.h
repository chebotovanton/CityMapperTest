#import <UIKit/UIKit.h>
#import "Facility.h"
#import "FacilitySelectionDelegate.h"

@interface FacilitiesCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;
+ (CGFloat)heightWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit;
- (void)setupWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit;

@property (weak, nullable) id <FacilitySelectionDelegate> delegate;

@end
