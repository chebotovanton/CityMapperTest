#ifndef FacilitySelectionDelegate_h
#define FacilitySelectionDelegate_h


#import "Facility.h"

@protocol FacilitySelectionDelegate

- (void)didSelectFacility:(nonnull Facility *)facility;

@end

#endif /* FacilitySelectionDelegate_h */
