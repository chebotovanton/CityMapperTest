#import "StationCell.h"

@interface StationCell()

@property (weak) IBOutlet UILabel *nameLabel;

@end

@implementation StationCell

+ (NSString *)reuseIdentifier {
    return @"stationCell";
}

- (void)setupWith:(nonnull Station *)station {
    self.nameLabel.text = station.name;
}

@end
