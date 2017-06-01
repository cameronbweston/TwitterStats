//
//  ManagedHashtag+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedHashtag+CoreDataProperties.h"

@implementation ManagedHashtag (CoreDataProperties)

+ (NSFetchRequest<ManagedHashtag *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Hashtag"];
}

@dynamic text;
@dynamic tweet;

@end
