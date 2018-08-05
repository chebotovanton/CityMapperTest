#import "StationsInfoLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "ApiKeyStorage.h"
#import "StationsParser.h"

@implementation StationsInfoLoader

- (void)loadStationsWithLat:(double)latitude lon:(double)longitude {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLRequest *request = [self requestWithLat:latitude lon:longitude];

    NSURLSessionTask *task = [manager dataTaskWithRequest:request
                                           uploadProgress:nil
                                         downloadProgress:nil
                                        completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                            if (error != nil) {
                                                [self.delegate didFailLoadingStations];
                                            } else {
                                                NSArray <Station *> *stations = [StationsParser stationsFrom:responseObject];
                                                [self.delegate didLoadStations:stations];
                                            }
                                        }];

    [task resume];
}

- (nonnull NSURLRequest *)requestWithLat:(double)latitude lon:(double)longitude {
    NSString *baseString = @"https://api.tfl.gov.uk/Stoppoint";
    NSDictionary *params = @{@"app_id" : [ApiKeyStorage appId],
                             @"app_key" : [ApiKeyStorage appKey],
                             @"radius" : @1000,
                             @"modes" : @"tube",
                             @"lon" : @(-0.1342989),
                             @"lat" : @51.5102296,
                             @"stoptypes" : @"NaptanMetroStation,NaptanRailStation"};

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET"
                                                                                 URLString:baseString
                                                                                parameters:params
                                                                                     error:nil];
    return request;
}

@end
