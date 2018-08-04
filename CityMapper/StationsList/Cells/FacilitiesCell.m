#import "FacilitiesCell.h"
#import "UIImage+ImageWithColor.h"

@interface FacilitiesCell()

@property NSArray <Facility *> *facilities;

@end

@implementation FacilitiesCell

+ (NSString *)reuseIdentifier {
    return @"facilitiesCell";
}

- (void)setupWith:(nonnull NSArray <Facility *> *)facilities {
    //warning: uitests
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    UIColor *textColor = [UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1];
    UIImage *backgroundImage = [UIImage imageWithColor:[UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1]];
    UIFont *font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    for (int i = 0; i < facilities.count; i++) {
        Facility *facility = facilities[i];
        UIButton *button = [UIButton new];
        [self addSubview:button];
        [button setTitle:facility.name forState:UIControlStateNormal];
        [button setTitleColor:textColor forState:UIControlStateNormal];
        button.titleLabel.font = font;
        [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        button.layer.cornerRadius = 4;
        button.clipsToBounds = YES;

        button.frame = CGRectMake(15, 20 * i, 300, 20);
    }
}

@end
