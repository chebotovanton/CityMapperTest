#import "StationItem.h"
#import "StationCell.h"

@interface StationItem()

@property (nonnull) Station *station;

@end

@implementation StationItem

- (id)initWithStation:(nonnull Station *)station {
    self = [super init];
    self.station = station;

    return self;
}

- (CGFloat)cellHeightWithWidth:(CGFloat)width {
    return 40;
}

- (nonnull UICollectionViewCell *)cellFor:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[StationCell reuseIdentifier] forIndexPath:indexPath];
    if ([cell isKindOfClass:[StationCell class]]) {
        StationCell *stationCell = (StationCell *)cell;
        [stationCell setupWith:self.station];
    }
    return cell;
}

@end
