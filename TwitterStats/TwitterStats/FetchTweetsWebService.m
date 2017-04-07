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

- (void)fetchTweets:(void (^)(NSDictionary *))callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //Configure session headers an oAuth token here
        //
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSString *urlString = [self buildURLString];
        NSURL *remoteURL = [NSURL URLWithString:urlString];
        NSURLRequest *request = [[NSURLRequest alloc]  initWithURL:remoteURL];
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
          }] resume];
    });
}

- (NSString *)buildURLString {
    return [NSString stringWithFormat:@"https://stream.twitter.com/1.1/statuses/sample.json"];
}

@end
