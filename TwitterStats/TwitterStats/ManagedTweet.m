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
@dynamic text;
@dynamic hashtags;
@dynamic urls;
@dynamic photoUrls;

+ (ManagedTweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context {
    ManagedTweet *tweet = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet"
                                                        inManagedObjectContext:context];
    tweet.tweetID = jsonTweet.tweetID;
    tweet.dateCreated = jsonTweet.dateCreated;
    tweet.text = jsonTweet.text;
    
    for (NSString *hashtag in jsonTweet.hashtags) {
        if (hashtag != [NSNull null]) {
            ManagedHashtag *managedHashtag = [NSEntityDescription insertNewObjectForEntityForName:@"Hashtag"
                                                                           inManagedObjectContext:context];
            //set relationship
            managedHashtag.text = hashtag;
            [tweet.hashtags addObject:managedHashtag];
        }
    }
    for (NSString *url in jsonTweet.urls) {
        if (url != [NSNull null]) {
            ManagedURL *managedURL = [NSEntityDescription insertNewObjectForEntityForName:@"URL"
                                                               inManagedObjectContext:context];
            //set relationship somehow
            managedURL.text = url;
            [tweet.urls addObject:managedURL];
        }
    }
//    for (NSString *photoUrl in jsonTweet.photoUrls) {
//        tweet.photoUrls = [[NSMutableSet alloc] init];
//        if (photoUrl != [NSNull null]) {
//        }
//    }
    return tweet;
}

@end
