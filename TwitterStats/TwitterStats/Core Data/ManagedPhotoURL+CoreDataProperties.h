//
//  ManagedPhotoURL+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedPhotoURL+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedPhotoURL (CoreDataProperties)

+ (NSFetchRequest<ManagedPhotoURL *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Tweet *relationship;

@end

NS_ASSUME_NONNULL_END
