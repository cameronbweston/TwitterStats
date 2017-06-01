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
#import "ManagedURL+CoreDataClass.h"
#import "ManagedPhotoURL+CoreDataClass.h"
#import "ManagedHashtag+CoreDataClass.h"

@interface ManagedTweet : NSManagedObject

+ (ManagedTweet *)loadFromJSONTweetObject:(JSONTweetObject *)jsonTweet context:(NSManagedObjectContext *)context;

@property (nonatomic, strong) NSString *dateCreated;
@property (nonatomic, strong) NSString *tweetID;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSMutableSet<ManagedHashtag*> *hashtags;
@property (nonatomic, strong) NSMutableSet<ManagedURL*> *urls;
@property (nonatomic, strong) NSMutableSet<ManagedPhotoURL*> *photoUrls;

@end
