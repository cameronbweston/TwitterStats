//
//  Tweet+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "Tweet+CoreDataProperties.h"

@implementation Tweet (CoreDataProperties)

+ (NSFetchRequest<Tweet *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Tweet"];
}

@dynamic dateCreated;
@dynamic text;
@dynamic tweetID;
@dynamic relationshipHashtag;
@dynamic relationshipPhotoURL;
@dynamic relationshipURL;

@end
