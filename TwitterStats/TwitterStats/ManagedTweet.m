//
//  ManagedTweet.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedTweet.h"

@implementation ManagedTweet

+ (ManagedTweet *)findOrCreateTweetWithIdentifier:(NSString *)identifier
                                        inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tweet"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"tweetId = %@", identifier];
    
    NSError *error;
    NSArray *result = [context executeFetchRequest:fetchRequest
                                             error:&error];
    if (error) {
        NSLog(@"Error in fetch request: %@", error.localizedDescription);
    }
    if (result.lastObject) {
        return result.lastObject;
    }
    else {
        ManagedTweet *tweet = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet"
                                                            inManagedObjectContext:context];
        //tweet.tweetId = identifier;
        return tweet;
    }
}

- (void)loadFromDictionary:(NSDictionary *)dictionary {
    
}

@end
