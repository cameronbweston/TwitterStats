//
//  ManagedURL+CoreDataProperties.m
//  
//
//  Created by Cameron Weston on 5/16/17.
//
//

#import "ManagedURL+CoreDataProperties.h"

@implementation ManagedURL (CoreDataProperties)

+ (NSFetchRequest<ManagedURL *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"URL"];
}

@dynamic text;
@dynamic relationship;

@end
