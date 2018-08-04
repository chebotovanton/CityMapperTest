#ifndef CollectionItemProtocol_h
#define CollectionItemProtocol_h

#import <UIKit/UIKit.h>

@protocol CollectionItemProtocol

- (CGFloat)cellHeight;
- (nonnull UICollectionViewCell *)cell;

@end

#endif /* CollectionItemProtocol_h */
