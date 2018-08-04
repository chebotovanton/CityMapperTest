#import "ViewController.h"
#import "StationsListControllerProtocol.h"
#import "StationCell.h"
#import "StationsListPresenter.h"

@interface ViewController() <StationsListControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak) IBOutlet UICollectionView *collectionView;
@property NSArray <id <CollectionItemProtocol>> *items;
@property StationsListPresenter *presenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    [self.collectionView setCollectionViewLayout:layout];

    //warning: Don't like this. ViewController knows about all cells and their nibs. Try to avoid this
    [self.collectionView registerNib:[UINib nibWithNibName:@"StationCell" bundle:nil] forCellWithReuseIdentifier:[StationCell reuseIdentifier]];

    self.presenter = [StationsListPresenter new];
    self.presenter.viewController = self;
    [self.presenter getNearbyStations];
}

#pragma mark - StationsListControllerProtocol

- (void)updateList:(NSArray <id <CollectionItemProtocol>> *)newItems {
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

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id <CollectionItemProtocol> item = self.items[indexPath.item];

    return [item cellFor:collectionView indexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id <CollectionItemProtocol> item = self.items[indexPath.item];

    return CGSizeMake(collectionView.frame.size.width, item.cellHeight);
}

@end
