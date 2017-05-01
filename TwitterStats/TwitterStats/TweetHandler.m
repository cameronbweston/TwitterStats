//
//  TweetHandler.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/6/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

//TwitterSessionManager

#import "TweetHandler.h"
#import "PromiseKit/PromiseKit.h"
#import "ManagedTweet.h"
#import "JSONTweetObject.h"

@interface TweetHandler ()

@property (nonatomic, strong) FetchTweetsWebService *tweetWebService;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation TweetHandler

- (instancetype)initWithContext:(NSManagedObjectContext *)context tweetWebservice:(FetchTweetsWebService *)tweetWebservice {
    self = [super init];
    if (self) {
        self.context = context;
        self.tweetWebService = tweetWebservice;
    }
    return self;
}

- (void)fetchAndSaveTweets {
    dispatch_queue_t getTweetsQueue = dispatch_queue_create("com.TwitterStats", NULL);
    
    dispatch_async(getTweetsQueue, ^{
        [self.tweetWebService fetchTweetsWithProgressBlock:^(NSDictionary *json, STTwitterStreamJSONType type) {
                NSLog(@"Fetched tweets: %@", json);
                JSONTweetObject *jsonTweet = [[JSONTweetObject alloc] initWithJSONObject:json];
                [ManagedTweet loadFromJSONTweetObject:jsonTweet context:self.context];
        } errorBlock:^(NSError *error) {
            if (error) {
                [self.context save:&error];
                NSLog(@"Error in TweetHandler: %@", error.localizedDescription);
            }
        }];
    });
}

- (void)closeStream {
    [self.tweetWebService closeStream];
    NSError __autoreleasing *error;
    const BOOL saved = [self.context save:&error];
    if (!saved) {
        NSLog(@"Failed to save Core Data: %@", error.localizedDescription);
    }
}

@end
