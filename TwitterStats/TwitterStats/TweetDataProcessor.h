//
//  TweetDataProcessor.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/21/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ManagedTweet;

@interface TweetDataProcessor : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTweets:(NSArray<ManagedTweet *> *)tweetArray NS_DESIGNATED_INITIALIZER;

- (double)percentageOfTweetsContainingEmoji;
- (double)percentageOfTweetsContainingURL;
- (double)percentageOfTweetsContainingPhotoURL;

- (double)averageTweetsPerSecond;
- (double)averageTweetsPerMinute;
- (double)averageTweetsPerHour;

@end
