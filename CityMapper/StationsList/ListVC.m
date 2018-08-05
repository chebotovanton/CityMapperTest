#import "ListVC.h"
#import "StationsListControllerProtocol.h"
#import "StationCell.h"
#import "StationsListPresenter.h"
#import "FacilitiesCell.h"
#import "TrainCell.h"

@interface ListVC() <StationsListControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak) IBOutlet UICollectionView *collectionView;
@property NSArray <NSArray <id <CollectionItemProtocol>> *> *items;
@property StationsListPresenter *presenter;

@end

@implementation ListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    [self.collectionView setCollectionViewLayout:layout];

    //warning: Don't like this. ViewController knows about all cells and their nibs. Try to avoid this
    [self.collectionView registerNib:[UINib nibWithNibName:@"StationCell" bundle:nil] forCellWithReuseIdentifier:[StationCell reuseIdentifier]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FacilitiesCell" bundle:nil] forCellWithReuseIdentifier:[FacilitiesCell reuseIdentifier]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TrainCell" bundle:nil] forCellWithReuseIdentifier:[TrainCell reuseIdentifier]];

    self.presenter = [StationsListPresenter new];
    self.presenter.viewController = self;
    [self.presenter getNearbyStations];
}

#pragma mark - StationsListControllerProtocol

- (void)updateList:(NSArray <NSArray <id <CollectionItemProtocol>> *> *)newItems {
    self.items = newItems;

    [self.collectionView reloadData];
}

- (void)presentError:(NSString *)description {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:description preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.items.count;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *sectionItems = self.items[section];
    return sectionItems.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionItems = self.items[indexPath.section];
    id <CollectionItemProtocol> item = sectionItems[indexPath.item];

    return [item cellFor:collectionView indexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionItems = self.items[indexPath.section];
    id <CollectionItemProtocol> item = sectionItems[indexPath.item];

    return CGSizeMake(collectionView.frame.size.width, [item cellHeightWithWidth:collectionView.frame.size.width]);
}

@end
