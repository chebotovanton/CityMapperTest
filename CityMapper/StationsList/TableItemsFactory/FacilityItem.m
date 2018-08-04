#import "FacilityItem.h"
#import "FacilitiesCell.h"

@interface FacilityItem()

@property (nonnull) NSArray <Facility *> *facilities;

@end

@implementation FacilityItem

- (id)initWithFacilities:(nonnull NSArray <Facility *> *)facilities {
    self = [super init];
    self.facilities = facilities;

    return self;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width {
    return [FacilitiesCell heightWith:self.facilities widthLimit:width];
}

- (nonnull UICollectionViewCell *)cellFor:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FacilitiesCell reuseIdentifier] forIndexPath:indexPath];
    if ([cell isKindOfClass:[FacilitiesCell class]]) {
        FacilitiesCell *facilitiesCell = (FacilitiesCell *)cell;
        [facilitiesCell setupWith:self.facilities widthLimit:collectionView.frame.size.width];
    }
    return cell;
}

@end
