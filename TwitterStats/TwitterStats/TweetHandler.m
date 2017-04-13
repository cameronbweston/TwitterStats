//
//  TweetHandler.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/6/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "TweetHandler.h"
#import "FetchTweetsWebService.h"

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

- (void)storeTweets {
        [self.tweetWebService fetchTweets:^(NSDictionary *data) {
            [self.context performBlock:^ {
                for (NSDictionary *tweet in data) {
                    //NSString *identifier = tweet[@"id"];
                    //find or create tweet with identifier
                    //tweet load from dictionary
                }
                NSError *error;
                [self.context save:&error];
                if (error) {
                    NSLog(@"Error in store tweets: %@", error.localizedDescription);
                }
            }];
        }];
}

@end
