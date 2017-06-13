//
//  ManagedURL+CoreDataProperties.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedURL+CoreDataProperties.h"

@implementation ManagedURL (CoreDataProperties)

+ (NSFetchRequest<ManagedURL *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"URL"];
}

@dynamic count;
@dynamic text;
@dynamic relationship;

@end
