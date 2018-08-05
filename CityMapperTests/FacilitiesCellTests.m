#import <XCTest/XCTest.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import "FacilitiesCell.h"

@interface FacilitiesCellTests : FBSnapshotTestCase

@end

@implementation FacilitiesCellTests

- (void)setUp {
    [super setUp];

//    self.recordMode = YES;
}

- (void)testExample {
    FacilitiesCell *cell = (FacilitiesCell *)[[[NSBundle mainBundle] loadNibNamed:@"FacilitiesCell" owner:nil options:nil] objectAtIndex:0];
    CGFloat width = 350;
    NSArray *facilities = [self fakeFacilities];
    CGFloat height = [FacilitiesCell heightWith:facilities widthLimit:width];
    cell.frame = CGRectMake(0, 0, width, height);
    [cell setupWith:facilities widthLimit:width];

    FBSnapshotVerifyView(cell, nil);

}

- (NSArray <Facility *> *)fakeFacilities {
    return @[[[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"Lifts"],
             [[Facility alloc] initWithName:@"Unexpected Long Facility Name. Longer than any line ever."],
             [[Facility alloc] initWithName:@"Waiting rooms"],
             [[Facility alloc] initWithName:@"Payphones"],
             [[Facility alloc] initWithName:@"Car Park"],
             [[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"WiFi"],
             [[Facility alloc] initWithName:@"WiFi"],];
}

@end
