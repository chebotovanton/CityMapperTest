#import "ViewController.h"
#import "StationsListControllerProtocol.h"

@interface ViewController() <StationsListControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak) UICollectionView *collectionView;
@property NSArray <id <CollectionItemProtocol>> *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //setup collection view
}

#pragma mark - StationsListControllerProtocol

- (void)updateList:(NSArray <id <CollectionItemProtocol>> *)newItems {
    self.items = newItems;

    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id <CollectionItemProtocol> item = self.items[indexPath.item];

    return [item cell];

}

@end
