#import "DateFormatter.h"

@implementation DateFormatter

//warning: It's worth adding tests here

+ (NSDateFormatter *)fromStringFormatter {
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [NSDateFormatter new];
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    }

    return formatter;
}

+ (nullable NSDate *)dateFromTflString:(nullable NSString *)dateString {
    return [[DateFormatter fromStringFormatter] dateFromString:dateString];
}

+ (nonnull NSString *)minutesStringBetween:(NSDate *)laterDate andDate:(NSDate *)earlierDate {
    NSTimeInterval interval = [laterDate timeIntervalSinceDate:earlierDate];
    int minutes = interval / 60;
    if (minutes < 1) {
        return @"Due";
    } else {
        return [NSString stringWithFormat:@"%i min", minutes];
    }
}

@end
