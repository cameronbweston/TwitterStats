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
            NSLog(@"Fetched Tweets: %@", json);
            if ([NSThread isMainThread]) {
                
            };
            // Safe to do core data as you are on the main thread

            //save json somehow for later
            //save to core data on main thread
        } errorBlock:^(NSError *error) {
            if (error) {
                NSLog(@"Error in fetching tweets: %@", error.localizedDescription);
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
// Make a new object that knows how to parse json into individual TWEET json objects -> returns an array of Tweet JSON
// Pass in each json object in Managed TWEET -> Turns it into core data

@end
