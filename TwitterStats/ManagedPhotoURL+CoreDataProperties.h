//
//  ManagedPhotoURL+CoreDataProperties.h
//  
//
//  Created by Cameron Weston on 6/1/17.
//
//

#import "ManagedPhotoURL+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedPhotoURL (CoreDataProperties)

+ (NSFetchRequest<ManagedPhotoURL *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Tweet *relationship;

@end

NS_ASSUME_NONNULL_END
