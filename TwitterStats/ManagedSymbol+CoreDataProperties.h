//
//  ManagedSymbol+CoreDataProperties.h
//  
//
//  Created by Cameron Weston on 5/30/17.
//
//

#import "ManagedSymbol+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedSymbol (CoreDataProperties)

+ (NSFetchRequest<ManagedSymbol *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Tweet *relationship;

@end

NS_ASSUME_NONNULL_END
