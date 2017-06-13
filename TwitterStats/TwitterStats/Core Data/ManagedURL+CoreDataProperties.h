//
//  ManagedURL+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedURL+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedURL (CoreDataProperties)

+ (NSFetchRequest<ManagedURL *> *)fetchRequest;

@property (nonatomic) int64_t count;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) NSSet<ManagedTweet *> *relationship;

@end

@interface ManagedURL (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(ManagedTweet *)value;
- (void)removeRelationshipObject:(ManagedTweet *)value;
- (void)addRelationship:(NSSet<ManagedTweet *> *)values;
- (void)removeRelationship:(NSSet<ManagedTweet *> *)values;

@end

NS_ASSUME_NONNULL_END
