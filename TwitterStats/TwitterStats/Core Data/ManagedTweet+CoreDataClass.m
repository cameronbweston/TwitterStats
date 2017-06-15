//
//  ManagedTweet+CoreDataClass.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedTweet+CoreDataClass.h"
#import "Emoji+CoreDataClass.h"
#import "ManagedHashtag+CoreDataClass.h"
#import "ManagedPhotoURL+CoreDataClass.h"
#import "ManagedURL+CoreDataClass.h"
#import "JSONTweetObject.h"
#import "NSString+Emoji.h"

@implementation ManagedTweet

+ (ManagedTweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context {
    ManagedTweet *tweet = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet"
                                                        inManagedObjectContext:context];
    tweet.tweetID = jsonTweet.tweetID;
    tweet.dateCreated = jsonTweet.dateCreated;
    tweet.text = jsonTweet.text;
    
    NSString *emojiString = [tweet.text stringByReplacingEmojiUnicodeWithCheatCodes];
    NSString *regexString = @":[a-z_]+:"; //finds emojiCheats like :joy: and :smile:
    
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionIgnoreMetacharacters error:nil];
    
    NSArray <NSTextCheckingResult *> *result = [expression matchesInString:emojiString options:0 range:NSMakeRange(0, [emojiString length]) ];
    if (result) {
        NSLog(@"array: %@", result);
    }
    
//    NSArray *wordArray = [emojiString componentsSeparatedByString:@" "];
//    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@":"];
//    
//    for (NSString *word in wordArray) {
//        NSRange range = [word rangeOfCharacterFromSet:charSet];
//        if (range.location != NSNotFound) {
//            // : is present
//            NSLog(@"WORD: %@", word);
//        }
//    }

    for (NSString *hashtag in jsonTweet.hashtags) {
        if (![hashtag isEqual:[NSNull null]]) {
            ManagedHashtag *managedHashtag = [ManagedHashtag findOrCreateHashtagWithText:hashtag andContext:context];
            managedHashtag.count += 1;
            managedHashtag.text = hashtag;
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
            ManagedPhotoURL *managedPhotoURL = [ManagedPhotoURL findOrCreatePhotoURLWithText:photoUrl andContext:context];
            managedPhotoURL.count += 1;
            managedPhotoURL.text = photoUrl;
            [tweet addPhotoURLsObject:managedPhotoURL];
        }
    }
    return tweet;
}

- (void)dealloc {
    NSLog(@"WTF");
}

@end
