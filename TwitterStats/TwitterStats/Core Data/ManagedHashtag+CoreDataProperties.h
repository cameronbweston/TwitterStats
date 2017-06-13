//
//  ManagedHashtag+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedHashtag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedHashtag (CoreDataProperties)

+ (NSFetchRequest<ManagedHashtag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nonatomic) int64_t count;
@property (nullable, nonatomic, retain) NSSet<ManagedTweet *> *tweet;

@end

@interface ManagedHashtag (CoreDataGeneratedAccessors)

- (void)addTweetObject:(ManagedTweet *)value;
- (void)removeTweetObject:(ManagedTweet *)value;
- (void)addTweet:(NSSet<ManagedTweet *> *)values;
- (void)removeTweet:(NSSet<ManagedTweet *> *)values;

@end

NS_ASSUME_NONNULL_END
