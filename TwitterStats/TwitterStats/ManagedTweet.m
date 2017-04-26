//
//  ManagedTweet.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedTweet.h"

@implementation ManagedTweet

@dynamic dateCreated;
@dynamic tweetID;
@dynamic hashtags;
@dynamic symbols;
@dynamic text;
@dynamic urls;

+ (ManagedTweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context {
    ManagedTweet *tweet = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet"
                                                        inManagedObjectContext:context];
    tweet.tweetID = jsonTweet.tweetID;
    tweet.dateCreated = jsonTweet.dateCreated;
    tweet.hashtags = jsonTweet.hashtags;
    tweet.symbols = jsonTweet.symbols;
    tweet.text = jsonTweet.text;
    tweet.urls = jsonTweet.urls;

    return tweet;
}

@end
