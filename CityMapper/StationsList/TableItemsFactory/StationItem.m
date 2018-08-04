#import "StationItem.h"

@interface StationItem()

@property (nonnull) Station *station;

@end

@implementation StationItem

- (id)initWithStation:(nonnull Station *)station {
    self = [super init];
    self.station = station;

    return self;
}

- (CGFloat)cellHeight {
    return 100;
}

- (nonnull UICollectionViewCell *)cell {
//warning: return something real
    return [UICollectionViewCell new];
}

@end
