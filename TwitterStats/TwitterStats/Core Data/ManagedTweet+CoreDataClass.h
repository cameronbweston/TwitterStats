//
//  ManagedTweet+CoreDataClass.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Emoji, ManagedHashtag, ManagedPhotoURL, ManagedURL, JSONTweetObject;

NS_ASSUME_NONNULL_BEGIN

@interface ManagedTweet : NSManagedObject

+ (ManagedTweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "ManagedTweet+CoreDataProperties.h"
