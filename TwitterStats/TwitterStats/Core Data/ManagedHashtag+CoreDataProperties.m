//
//  ManagedHashtag+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedHashtag+CoreDataProperties.h"

@implementation ManagedHashtag (CoreDataProperties)

+ (NSFetchRequest<ManagedHashtag *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Hashtag"];
}

@dynamic text;
@dynamic count;
@dynamic tweet;

@end
