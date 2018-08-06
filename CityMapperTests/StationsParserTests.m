#import <XCTest/XCTest.h>
#import "StationsParser.h"

@interface StationsParserTests : XCTestCase

@end

@implementation StationsParserTests

- (void)testParseNil {
    NSArray *result = [StationsParser stationsFrom:nil];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testParseEmptyDict {
    NSArray *result = [StationsParser stationsFrom:@[@"firstString", @"secondString"]];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testIncorrectDictStructure {
    NSDictionary *dict = @{@"incorrectKey" : @"someValue"};
    NSArray *result = [StationsParser stationsFrom:dict];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testIncorrectStationsStructure {

    NSArray *array = @[@{@"wrongKey": @"wrongValue"},
                       @2,
                       @{@"lineName": @"someLine", @"platformName": @"somePlatform", @"expectedArrival": @2}];
    NSDictionary *dict = @{@"stopPoints" : array};
    NSArray *result = [StationsParser stationsFrom:dict];
    XCTAssertEqualObjects(result, @[]);
}

- (void)testCorrectParsing {
    NSArray *array = @[@{@"commonName": @"someName", @"naptanId" : @"someId"},
                       @2,
                       @{@"commonName": @"anotherName", @"naptanId" : @"anotherId"}];
    NSDictionary *dict = @{@"stopPoints" : array};
    NSArray *result = [StationsParser stationsFrom:dict];
    XCTAssertEqual(result.count, 2);
    Station *station = result.firstObject;
    XCTAssertEqualObjects(station.name, @"someName");
    XCTAssertEqualObjects(station.stationId, @"someId");
}

@end
