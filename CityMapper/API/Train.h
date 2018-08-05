#import <Foundation/Foundation.h>

@interface Train : NSObject

@property (nonnull) NSString *lineName;
@property (nonnull) NSString *platformName;
@property (nonnull) NSDate *arrivalDate;

- (id)initWithLineName:(NSString *)lineName platformName:(NSString *)platformName arrivalDate:(NSDate *)arrivalDate;

@end
