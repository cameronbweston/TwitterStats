//
//  ManagedPhotoURL+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedPhotoURL+CoreDataProperties.h"

@implementation ManagedPhotoURL (CoreDataProperties)

+ (NSFetchRequest<ManagedPhotoURL *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PhotoURL"];
}

@dynamic text;
@dynamic count;
@dynamic tweet;

@end
