//
//  ManagedEmoji+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedEmoji+CoreDataProperties.h"

@implementation ManagedEmoji (CoreDataProperties)

+ (NSFetchRequest<ManagedEmoji *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Emoji"];
}

@dynamic count;
@dynamic text;

@end
