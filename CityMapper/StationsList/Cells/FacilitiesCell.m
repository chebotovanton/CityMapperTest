#import "FacilitiesCell.h"
#import "UIImage+ImageWithColor.h"

@interface FacilitiesCell()

@property NSArray <Facility *> *facilities;

@end

@implementation FacilitiesCell

+ (NSString *)reuseIdentifier {
    return @"facilitiesCell";
}

+ (UIFont *)titleFont {
    static UIFont *titleFont = nil;
    if (titleFont == nil) {
        titleFont = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    }

    return titleFont;
}

+ (UIImage *)backgroundImage {
    static UIImage *backgroundImage = nil;
    if (backgroundImage == nil) {
        backgroundImage = [UIImage imageWithColor:[UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1]];
    }

    return backgroundImage;
}

+ (UIColor *)textColor {
    static UIColor *textColor = nil;
    if (textColor == nil) {
        textColor = [UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1];
    }

    return textColor;
}

+ (CGFloat)heightWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit {
    //WARNING: Avoid duplication
    int rows = 0;
    CGPoint origin = CGPointMake(15, 0);
    CGFloat buttonHeight = 20;
    CGFloat verticalOffset = 4;
    CGFloat horizontalOffset = 4;

    for (int i = 0; i < facilities.count; i++) {
        Facility *facility = facilities[i];

        CGFloat buttonWidth = [facility.name sizeWithAttributes:@{NSFontAttributeName : [FacilitiesCell titleFont]}].width + 20;

        if (origin.x + buttonWidth > widthLimit) {
            origin.x = 15;
            rows += 1;
            origin.y = rows * (buttonHeight + verticalOffset);
        }

        origin.x += buttonWidth;
        origin.x += horizontalOffset;
    }

    return origin.y + buttonHeight;
}

- (void)setupWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit {
    //warning: uitests
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }

    int rows = 0;
    CGPoint origin = CGPointMake(15, 0);
    CGFloat buttonHeight = 20;
    CGFloat verticalOffset = 4;
    CGFloat horizontalOffset = 4;

    for (int i = 0; i < facilities.count; i++) {
        Facility *facility = facilities[i];
        UIButton *button = [self buttonWithTitle:facility.name];
        [self addSubview:button];

        CGFloat buttonWidth = [facility.name sizeWithAttributes:@{NSFontAttributeName : [FacilitiesCell titleFont]}].width + 20;

        if (origin.x + buttonWidth > widthLimit) {
            origin.x = 15;
            rows += 1;
            origin.y = rows * (buttonHeight + verticalOffset);
        }

        button.frame = CGRectMake(origin.x, origin.y, buttonWidth, buttonHeight);
        origin.x += buttonWidth;
        origin.x += horizontalOffset;
    }
}

- (nonnull UIButton *)buttonWithTitle:(nonnull NSString *)title {
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[FacilitiesCell textColor] forState:UIControlStateNormal];
    button.titleLabel.font = [FacilitiesCell titleFont];
    [button setBackgroundImage:[FacilitiesCell backgroundImage] forState:UIControlStateNormal];
    button.layer.cornerRadius = 4;
    button.clipsToBounds = YES;

    return button;
}

@end
