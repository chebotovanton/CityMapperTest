#import "FacilitiesCell.h"
#import "UIImage+ImageWithColor.h"

struct UISettings {
    CGFloat horizontalOffset;
    CGFloat buttonHeight;
    CGFloat verticalOffset;
    CGFloat buttonInsets;
    CGFloat containerInset;
};

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

+ (struct UISettings)defaultSettings {
    struct UISettings settings;
    settings.buttonHeight = 20;
    settings.verticalOffset = 4;
    settings.horizontalOffset = 4;
    settings.buttonInsets = 10;
    settings.containerInset = 10;

    return settings;
}

+ (CGFloat)heightWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit {
    //WARNING: Avoid duplication
    struct UISettings settings = [self defaultSettings];
    CGPoint origin = CGPointMake(settings.containerInset, 0);

    for (int i = 0; i < facilities.count; i++) {
        Facility *facility = facilities[i];

        CGFloat buttonWidth = [facility.name sizeWithAttributes:@{NSFontAttributeName : [FacilitiesCell titleFont]}].width + settings.buttonInsets;
        origin = [FacilitiesCell pointToDraw:buttonWidth settings:settings originPoint:origin widthLimit:widthLimit];
        origin.x += buttonWidth;
        origin.x += settings.horizontalOffset;
    }

    return origin.y + settings.buttonHeight;
}

- (void)setupWith:(nonnull NSArray <Facility *> *)facilities widthLimit:(CGFloat)widthLimit {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }

    self.facilities = facilities;

    struct UISettings settings = [FacilitiesCell defaultSettings];
    CGPoint origin = CGPointMake(settings.containerInset, 0);

    for (int i = 0; i < facilities.count; i++) {
        Facility *facility = facilities[i];
        UIButton *button = [self buttonWithTitle:facility.name];
        [self addSubview:button];

        CGFloat buttonWidth = [facility.name sizeWithAttributes:@{NSFontAttributeName : [FacilitiesCell titleFont]}].width + settings.buttonInsets;
        buttonWidth = MIN(buttonWidth, widthLimit - 2 * settings.containerInset);
        origin = [FacilitiesCell pointToDraw:buttonWidth settings:settings originPoint:origin widthLimit:widthLimit];
        button.frame = CGRectMake(origin.x, origin.y, buttonWidth, settings.buttonHeight);
        origin.x += buttonWidth;
        origin.x += settings.horizontalOffset;
    }
}

+ (CGPoint)pointToDraw:(CGFloat)textWidth settings:(struct UISettings)settings originPoint:(CGPoint)origin widthLimit:(CGFloat)widthLimit {
    if (origin.x + textWidth + settings.containerInset > widthLimit) {
        origin.x = settings.containerInset;
        origin.y += settings.buttonHeight + settings.verticalOffset;
    }

    return origin;
}

- (nonnull UIButton *)buttonWithTitle:(nonnull NSString *)title {
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[FacilitiesCell textColor] forState:UIControlStateNormal];
    button.titleLabel.font = [FacilitiesCell titleFont];
    [button setBackgroundImage:[FacilitiesCell backgroundImage] forState:UIControlStateNormal];
    button.layer.cornerRadius = 4;
    button.clipsToBounds = YES;
    [button addTarget:self action:@selector(facilitySelected:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

- (void)facilitySelected:(UIButton *)sender {
    //warning: that's ugly. Create any link between buttons and facilities
    NSString *text = sender.titleLabel.text;
    if (text.length == 0) {
        return;
    }
    for (Facility *facility in self.facilities) {
        if ([text isEqualToString:facility.name]) {
            [self.delegate didSelectFacility:facility];
            return;
        }
    }
}

@end
