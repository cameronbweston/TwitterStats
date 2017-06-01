//
//  JSONTweetObject.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/25/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "JSONTweetObject.h"

@interface JSONTweetObject ()

@end

@implementation JSONTweetObject

- (instancetype)initWithJSONObject:(__kindof NSObject *)jsonObject {
    if (self = [super init]) {
        self.hashtags = [[NSMutableArray alloc] init];
        self.urls = [[NSMutableArray alloc] init];
        self.photoUrls = [[NSMutableArray alloc] init];
        
        [self loadFromDictionary:jsonObject];
    }
    return self;
}

- (void)loadFromDictionary:(NSDictionary *)jsonTweet {
    if ([jsonTweet valueForKey:@"id_str"] != [NSNull null]) {
        self.tweetID = [jsonTweet valueForKey:@"id_str"];
    }
    if ([jsonTweet valueForKeyPath:@"text"] != [NSNull null]) {
        self.text = [jsonTweet valueForKeyPath:@"text"];
    }
    if ([jsonTweet valueForKeyPath:@"created_at"] != [NSNull null]) {
        self.dateCreated = [jsonTweet valueForKeyPath:@"created_at"];
    }
    if ([[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"hashtags"] != [NSNull null]) {
        NSDictionary *subHashtagDictionary = jsonTweet[@"entities"][@"hashtags"];
        for (NSDictionary *hashtag in subHashtagDictionary) {
            NSString *hashtagText = [hashtag valueForKeyPath:@"text"];
            if (hashtagText != nil) {
                [self.hashtags addObject:hashtagText];
            }
        }
    }
    if ([[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"urls"] != [NSNull null]) {
        NSDictionary *subURLDictionary = jsonTweet[@"entities"][@"urls"];
        for (NSDictionary *url in subURLDictionary) {
            NSString *expandedURLString = [url valueForKeyPath:@"expanded_url"];
            if (expandedURLString != nil) {
                [self.urls addObject:expandedURLString];
            }
        }
    }
    if ([[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"media"] != [NSNull null]) {
        NSDictionary *subMediaDictionary = jsonTweet[@"entities"][@"media"];
        for (NSDictionary *mediaUrl in subMediaDictionary) {
            NSString *mediaURLString = [mediaUrl valueForKeyPath:@"media_url"];
            if (mediaURLString != nil) {
                [self.photoUrls addObject:mediaURLString];
            }
        }
    }
}

@end
