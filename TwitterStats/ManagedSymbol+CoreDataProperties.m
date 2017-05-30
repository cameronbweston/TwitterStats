//
//  ManagedSymbol+CoreDataProperties.m
//  
//
//  Created by Cameron Weston on 5/30/17.
//
//

#import "ManagedSymbol+CoreDataProperties.h"

@implementation ManagedSymbol (CoreDataProperties)

+ (NSFetchRequest<ManagedSymbol *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Symbol"];
}

@dynamic text;
@dynamic relationship;

@end
