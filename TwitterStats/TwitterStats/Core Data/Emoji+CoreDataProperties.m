//
//  Emoji+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "Emoji+CoreDataProperties.h"

@implementation Emoji (CoreDataProperties)

+ (NSFetchRequest<Emoji *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Emoji"];
}

@dynamic count;
@dynamic text;
@dynamic tweet;

@end
