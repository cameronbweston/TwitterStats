//
//  ManagedTweet+CoreDataClass.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedTweet+CoreDataClass.h"
#import "ManagedHashtag+CoreDataClass.h"
#import "ManagedPhotoURL+CoreDataClass.h"
#import "ManagedURL+CoreDataClass.h"
#import "JSONTweetObject.h"

@implementation ManagedTweet

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
            [tweet addHashtagsObject:managedHashtag];
        }
    }
    for (NSString *url in jsonTweet.urls) {
        if (url != [NSNull null]) {
            ManagedURL *managedURL = [NSEntityDescription insertNewObjectForEntityForName:@"URL"
                                                                   inManagedObjectContext:context];
            //set relationship somehow
            managedURL.text = url;
            [tweet addUrlsObject:managedURL];
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
