//
//  Tweet+CoreDataClass.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class JSONTweetObject;
@class ManagedHashtag, ManagedPhotoURL, ManagedURL;

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSManagedObject

+ (Tweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Tweet+CoreDataProperties.h"
