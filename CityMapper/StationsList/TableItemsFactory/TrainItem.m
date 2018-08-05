#import "TrainItem.h"
#import "TrainCell.h"

@interface TrainItem()

@property (nonnull) Train *train;

@end

@implementation TrainItem

- (id)initWithTrain:(nonnull Train *)train {
    self = [super init];

    self.train = train;

    return self;
}

#pragma mark - CollectionItemProtocol

- (CGFloat)cellHeightWithWidth:(CGFloat)width {
    return 40;
}

- (nonnull UICollectionViewCell *)cellFor:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TrainCell reuseIdentifier] forIndexPath:indexPath];
    if ([cell isKindOfClass:[TrainCell class]]) {
        TrainCell *trainCell = (TrainCell *)cell;
        [trainCell setupWith:self.train];
    }
    return cell;
}

@end
