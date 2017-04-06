//
//  FetchTweetsWebService.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchTweetsWebService.h"

@implementation FetchTweetsWebService

- (void)fetchTweets:(void (^)(NSDictionary *))callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
}

- (NSString *)buildURLString {
    return [NSString stringWithFormat:@"https://stream.twitter.com/1.1/statuses/sample.json"];
}

@end
