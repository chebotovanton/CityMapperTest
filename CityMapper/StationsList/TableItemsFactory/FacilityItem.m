#import "FacilityItem.h"
#import "FacilitiesCell.h"

@interface FacilityItem()

@property (nonnull) NSArray <Facility *> *facilities;
@property (weak, nullable) id <FacilitySelectionDelegate> delegate;

@end

@implementation FacilityItem

- (id)initWithFacilities:(nonnull NSArray <Facility *> *)facilities delegate:(id <FacilitySelectionDelegate>)delegate {
    self = [super init];
    self.facilities = facilities;
    self.delegate = delegate;

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
        facilitiesCell.delegate = self.delegate;
    }
    return cell;
}

@end
