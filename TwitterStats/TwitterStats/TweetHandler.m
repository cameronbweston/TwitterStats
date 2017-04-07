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
@property (nonatomic) NSInteger *tweetCount;

@end

@implementation TweetHandler

- (id)initWithWebService:(FetchTweetsWebService *)webservice
{
    self = [super init];
    if (self) {
        self.tweetWebService = webservice;
    }
    return self;
}

- (void)getTweetCount {
    self.tweetCount = 0;

    [self.tweetWebService fetchTweets:^(NSDictionary *dataDictionary)
    {
        for(NSDictionary *tweet in dataDictionary) {
            if (tweet){
                self.tweetCount += 1;
            }
        }
        NSError *error = nil;
        if (error) {
            NSLog(@"Error in TweetHandler: %@", error.localizedDescription);
        }
    }];
}

@end
