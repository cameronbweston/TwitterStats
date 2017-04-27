//
//  JSONTweetObject.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/25/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "JSONTweetObject.h"

@implementation JSONTweetObject

- (instancetype)initWithJSONObject:(__kindof NSObject *)jsonObject {
    if (self = [super init]) {
        [self loadFromDictionary:jsonObject];
    }
    return self;
}

- (void)loadFromDictionary:(NSDictionary *)jsonTweet {
    if ([jsonTweet valueForKey:@"id_str"] != [NSNull null]) {
        self.tweetID = [jsonTweet valueForKey:@"id_str"];
    }
    if ([[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"hashtags"] != [NSNull null]) {
        self.hashtags = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"hashtags"];
    }
    if ([[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"symbols"] != [NSNull null]) {
        self.symbols = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"symbols"];
    }
    if ([[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"urls"] != [NSNull null]) {
        self.urls = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"urls"];
    }
    if ([jsonTweet valueForKeyPath:@"text"] != [NSNull null]) {
        self.text = [jsonTweet valueForKeyPath:@"text"];
    }
    if ([jsonTweet valueForKeyPath:@"created_at"] != [NSNull null]) {
        self.dateCreated = [jsonTweet valueForKeyPath:@"created_at"];
    }
        NSArray *item2 = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"hashtags"];
        NSArray *item3 = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"symbols"];
        NSArray *item4 = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"urls"];
        NSString *item5 = [jsonTweet valueForKeyPath:@"text"];
        NSString *item6 = [jsonTweet valueForKeyPath:@"created_at"];
    
}

@end
