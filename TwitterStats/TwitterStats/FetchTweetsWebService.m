//
//  FetchTweetsWebService.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchTweetsWebService.h"

@interface FetchTweetsWebService ()

@property (nonatomic, strong) STTwitterAPI *twitter;
@property (nonatomic, strong) NSObject <STTwitterRequestProtocol> *request;

@end

@implementation FetchTweetsWebService

static NSString *const consumerKey = @"zrRDwT5nRqR6fAA7KjRMKELXk";
static NSString *const consumerSecret = @"QBzKTcGV4yh8mSaVQiEVgtgUJlqzlxCHw7Xc16aUH2Q9pqHCZu";
static NSString *const oAuthToken = @"342813334-jegG0hcgPklD54EwIxJAgFVKikb3etzmB5NijRt3";
static NSString *const oAuthSecret = @"hhgqT1hTUdE34cFs8w7LtuH6KjXXB7S9yD4aHtgUqpCJd";

- (void)fetchTweetsWithProgressBlock:(void(^)(NSDictionary *json, STTwitterStreamJSONType type))progressBlock errorBlock:(void(^)(NSError *))errorBlock {
    self.twitter = [STTwitterAPI twitterAPIWithOAuthConsumerKey:consumerKey
                                                 consumerSecret:consumerSecret
                                                     oauthToken:oAuthToken
                                               oauthTokenSecret:oAuthSecret];
    
    [self.twitter verifyCredentialsWithUserSuccessBlock:^(NSString *username, NSString *userID) {
        self.request = [self.twitter getStatusesSampleStallWarnings:@NO progressBlock:progressBlock errorBlock:errorBlock];
    } errorBlock:^(NSError *error) {
        if (error) {
            NSLog(@"Error with verify credentials: %@", error.localizedDescription);
        }
    }];
}

- (void)closeStream {
    [self.request cancel];
}

@end
