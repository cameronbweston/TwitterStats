//
//  ManagedPhotoURL+CoreDataProperties.m
//  
//
//  Created by Cameron Weston on 6/1/17.
//
//

#import "ManagedPhotoURL+CoreDataProperties.h"

@implementation ManagedPhotoURL (CoreDataProperties)

+ (NSFetchRequest<ManagedPhotoURL *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PhotoURL"];
}

@dynamic text;
@dynamic relationship;

@end
