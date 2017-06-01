//
//  ManagedHashtag+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedHashtag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedHashtag (CoreDataProperties)

+ (NSFetchRequest<ManagedHashtag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Tweet *tweet;

@end

NS_ASSUME_NONNULL_END
