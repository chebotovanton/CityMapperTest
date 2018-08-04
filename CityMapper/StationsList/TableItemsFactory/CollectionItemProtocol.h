#ifndef CollectionItemProtocol_h
#define CollectionItemProtocol_h

#import <UIKit/UIKit.h>

@protocol CollectionItemProtocol

- (CGFloat)cellHeight;
- (nonnull UICollectionViewCell *)cellFor:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end

#endif /* CollectionItemProtocol_h */
