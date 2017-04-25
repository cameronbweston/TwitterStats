//
//  ManagedTweet.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "JSONTweetObject.h"

@interface ManagedTweet : NSManagedObject

+ (ManagedTweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context;

@property (nonatomic, strong) NSString *dateCreated;
@property (nonatomic, strong) NSString *tweetID;
@property (nonatomic, strong) NSString *hashtags;
@property (nonatomic, strong) NSString *symbols;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *urls;
@property (nonatomic, strong) NSString *emojis;

@end
