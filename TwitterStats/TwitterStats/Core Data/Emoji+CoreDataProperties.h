//
//  Emoji+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "Emoji+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Emoji (CoreDataProperties)

+ (NSFetchRequest<Emoji *> *)fetchRequest;

@property (nonatomic) int64_t count;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) NSSet<ManagedTweet *> *tweet;

@end

@interface Emoji (CoreDataGeneratedAccessors)

- (void)addTweetObject:(ManagedTweet *)value;
- (void)removeTweetObject:(ManagedTweet *)value;
- (void)addTweet:(NSSet<ManagedTweet *> *)values;
- (void)removeTweet:(NSSet<ManagedTweet *> *)values;

@end

NS_ASSUME_NONNULL_END
