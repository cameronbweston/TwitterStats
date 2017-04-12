//
//  FetchTweetsWebService.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchTweetsWebService.h"

@interface FetchTweetsWebService () <NSURLSessionDelegate>

@end

@implementation FetchTweetsWebService

static NSString *const token = @"342813334-jegG0hcgPklD54EwIxJAgFVKikb3etzmB5NijRt3";

- (void)fetchTweets:(void (^)(NSDictionary *))callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSString *urlString = [self buildURLString];
        NSURL *remoteURL = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]  initWithURL:remoteURL];
        [request addValue:token forHTTPHeaderField:@"Authorization"];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
        
        [[session dataTaskWithRequest:request completionHandler:
          ^(NSData *data, NSURLResponse *response, NSError *error) {
              if (error) {
                  NSLog(@"error: %@", error.localizedDescription);
                  callback(nil);
                  return;
              }
              NSError *jsonError = nil;
              NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
              callback(result);
              NSLog(@"HERE IS THE RESULT: %@", result);
              if (jsonError) {
                  NSLog(@"Error with json: %@", jsonError.localizedDescription);
              }
          }] resume];
    });
}

- (NSString *)buildURLString {
    return [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
}

@end
