#import "TrainCell.h"

@interface TrainCell()

@property (weak) IBOutlet UILabel *lineNameLabel;
@property (weak) IBOutlet UILabel *platformLabel;
@property (weak) IBOutlet UILabel *arrivalTimeLabel;

@end

@implementation TrainCell

+ (NSString *)reuseIdentifier {
    return @"trainCell";
}

- (void)setupWith:(nonnull Train *)train {
    self.lineNameLabel.text = train.lineName;
    self.platformLabel.text = train.platformName;
    self.arrivalTimeLabel.text = @"3 min";
}

@end
