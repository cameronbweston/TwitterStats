//
//  ManagedHashtag+CoreDataProperties.m
//  
//
//  Created by Cameron Weston on 5/30/17.
//
//

#import "ManagedHashtag+CoreDataProperties.h"

@implementation ManagedHashtag (CoreDataProperties)

+ (NSFetchRequest<ManagedHashtag *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Hashtag"];
}

@dynamic text;
@dynamic relationship;

@end
