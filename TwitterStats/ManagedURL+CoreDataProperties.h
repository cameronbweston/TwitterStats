//
//  ManagedURL+CoreDataProperties.h
//  
//
//  Created by Cameron Weston on 6/1/17.
//
//

#import "ManagedURL+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedURL (CoreDataProperties)

+ (NSFetchRequest<ManagedURL *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Tweet *relationship;

@end

NS_ASSUME_NONNULL_END
