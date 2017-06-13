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
        if (![hashtag isEqual:[NSNull null]]) {
            ManagedHashtag *managedHashtag = [NSEntityDescription insertNewObjectForEntityForName:@"Hashtag"
                                                                           inManagedObjectContext:context];
            managedHashtag.text = hashtag;
            managedHashtag.count += 1;
            [tweet addHashtagsObject:managedHashtag];
        }
    }
    for (NSString *url in jsonTweet.urls) {
        if (![url isEqual:[NSNull null]]) {
            ManagedURL *managedURL = [ManagedURL findOrCreateURLWithText:url andContext:context];
            managedURL.count += 1;
            [tweet addUrlsObject:managedURL];
        }
    }
    for (NSString *photoUrl in jsonTweet.photoUrls) {
        if (![photoUrl isEqual:[NSNull null]]) {
            ManagedPhotoURL *managedPhotoURL = [NSEntityDescription insertNewObjectForEntityForName:@"PhotoURL"
                                                                             inManagedObjectContext:context];
            managedPhotoURL.text = photoUrl;
            managedPhotoURL.count += 1;
            [tweet addPhotoURLsObject:managedPhotoURL];
        }
    }
    return tweet;
}

@end
