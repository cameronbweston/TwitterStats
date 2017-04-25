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
        self.tweetID = jsonTweet[@"id_str"];
    }
    if ([jsonTweet valueForKeyPath:@"hashtags"] != [NSNull null]) {
        self.hashtags = jsonTweet[@"hashtags"];
    }
    if ([jsonTweet valueForKeyPath:@"symbols"] != [NSNull null]) {
        self.symbols = jsonTweet[@"symbols"];
    }
    if ([jsonTweet valueForKeyPath:@"urls"] != [NSNull null]) {
        self.urls = jsonTweet[@"urls"];
    }
    if ([jsonTweet valueForKeyPath:@"text"] != [NSNull null]) {
        self.text = jsonTweet[@"text"];
    }
    if ([jsonTweet valueForKeyPath:@"created_at"] != [NSNull null]) {
        self.dateCreated = jsonTweet[@"created_at"];
    }
}

@end
