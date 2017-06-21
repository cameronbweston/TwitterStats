//
//  ManagedTweet+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/20/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedTweet+CoreDataProperties.h"

@implementation ManagedTweet (CoreDataProperties)

+ (NSFetchRequest<ManagedTweet *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Tweet"];
}

@dynamic dateCreated;
@dynamic text;
@dynamic tweetID;
@dynamic containsEmoji;
@dynamic containsURL;
@dynamic containsPhotoURL;
@dynamic emojis;
@dynamic hashtags;
@dynamic photoURLs;
@dynamic urls;

@end
