//
//  TweetDataProcessor.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/21/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "TweetDataProcessor.h"
#import "ManagedTweet+CoreDataClass.h"

@interface TweetDataProcessor ()

@property (nonatomic, strong) NSArray<ManagedTweet *> *tweets;

@end

@implementation TweetDataProcessor

- (instancetype)initWithTweets:(NSArray<ManagedTweet *> *)tweetArray {
    if (self = [super init]) {
        self.tweets = tweetArray;
    }
    
    return self;
}

- (double)percentageOfTweetsContainingEmoji {
    NSPredicate *const containsEmoji = [NSPredicate predicateWithFormat:@"containsEmoji == YES"];
    NSArray<ManagedTweet *> *const tweetsContainingEmoji = [self.tweets filteredArrayUsingPredicate:containsEmoji];
    
    return (double)tweetsContainingEmoji.count / self.tweets.count * 100;
}

- (double)percentageOfTweetsContainingURL {
    NSPredicate *const containsURL = [NSPredicate predicateWithFormat:@"containsURL == YES"];
    NSArray<ManagedTweet *> *const tweetsContainingURL = [self.tweets filteredArrayUsingPredicate:containsURL];
    
    return (double)tweetsContainingURL.count / self.tweets.count * 100;
}

- (double)percentageOfTweetsContainingPhotoURL {
    NSPredicate *const containsPhotoURL = [NSPredicate predicateWithFormat:@"containsPhotoURL == YES"];
    NSArray<ManagedTweet *> *const tweetsContainingPhotoURL = [self.tweets filteredArrayUsingPredicate:containsPhotoURL];
    
    return (double)tweetsContainingPhotoURL.count / self.tweets.count * 100;
}

- (double)averageTweetsPerSecond {
    NSArray *uniqueDatesArray = [self.tweets valueForKey:[ManagedTweet dateCreatedAttributeName]];
    NSSet *uniqueDates = [NSSet setWithArray:uniqueDatesArray];
    return self.tweets.count / uniqueDates.count;
}

- (double)averageTweetsPerMinute {
    return [self averageTweetsPerSecond] * 60;
}

- (double)averageTweetsPerHour {
    return [self averageTweetsPerMinute] * 60;
}

@end
