//
//  ManagedHashtag+CoreDataProperties.h
//  
//
//  Created by Cameron Weston on 5/30/17.
//
//

#import "ManagedHashtag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedHashtag (CoreDataProperties)

+ (NSFetchRequest<ManagedHashtag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Tweet *relationship;

@end

NS_ASSUME_NONNULL_END
