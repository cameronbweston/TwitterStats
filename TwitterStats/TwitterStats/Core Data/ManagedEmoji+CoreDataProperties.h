//
//  ManagedEmoji+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedEmoji+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedEmoji (CoreDataProperties)

+ (NSFetchRequest<ManagedEmoji *> *)fetchRequest;

@property (nonatomic) int64_t count;
@property (nullable, nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
