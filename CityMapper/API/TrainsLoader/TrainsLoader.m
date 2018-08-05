#import "TrainsLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "ApiKeyStorage.h"
#import "TrainsParser.h"

@implementation TrainsLoader

- (void)loadTrainsForStation:(nonnull Station *)station {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLRequest *request = [self requestWithStation:station];

    NSURLSessionTask *task = [manager dataTaskWithRequest:request
                                           uploadProgress:nil
                                         downloadProgress:nil
                                        completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                            if (error == nil) {
                                                NSArray <Train *> *trains = [TrainsParser trainsFrom:responseObject];
                                                [self.delegate didLoadTrains:trains forStation:station];
                                            }
                                        }];

    [task resume];
}

- (nonnull NSURLRequest *)requestWithStation:(Station *)station {
    NSString *baseString = [NSString stringWithFormat:@"https://api.tfl.gov.uk/StopPoint/%@/Arrivals", station.stationId];
    NSDictionary *params = @{@"app_id" : [ApiKeyStorage appId],
                             @"app_key" : [ApiKeyStorage appKey],
                             @"modes" : @"tube"};

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET"
                                                                                 URLString:baseString
                                                                                parameters:params
                                                                                     error:nil];
    return request;
}


@end
