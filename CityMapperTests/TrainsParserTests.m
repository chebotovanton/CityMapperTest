#import <XCTest/XCTest.h>
#import "TrainsParser.h"

@interface TrainsParserTests : XCTestCase
@end

@implementation TrainsParserTests

- (void)testParseNil {
    NSArray *result = [TrainsParser trainsFrom:nil];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testParseEmptyDict {
    NSArray *result = [TrainsParser trainsFrom:@[]];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testIncorrectDictStructure {
    NSArray *array = @[@"Not a train", @2];
    NSArray *result = [TrainsParser trainsFrom:array];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testIncorrectTrainStructure {
    NSArray *array = @[@{@"wrongKey": @"wrongValue"},
                       @2,
                       @{@"lineName": @"someLine", @"platformName": @"somePlatform", @"expectedArrival": @2}];
    NSArray *result = [TrainsParser trainsFrom:array];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testCorrectParsing {
    NSArray *array = @[@{@"lineName": @"someLine", @"platformName": @"somePlatform", @"expectedArrival": @"2018-08-05T07:03:14Z"}];
    NSArray *result = [TrainsParser trainsFrom:array];
    Train *train = result.firstObject;
    XCTAssertEqualObjects(train.lineName, @"someLine");
}
@end
