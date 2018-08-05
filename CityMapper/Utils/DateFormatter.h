#import <Foundation/Foundation.h>

@interface DateFormatter : NSObject

+ (nullable NSDate *)dateFromTflString:(nullable NSString *)dateString;
+ (nonnull NSString *)minutesStringBetween:(NSDate *)laterDate andDate:(NSDate *)earlierDate;

@end
