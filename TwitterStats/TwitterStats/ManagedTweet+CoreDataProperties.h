//
//  ManagedTweet+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedTweet+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ManagedTweet (CoreDataProperties)

+ (NSFetchRequest<ManagedTweet *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dateCreated;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, copy) NSString *tweetID;
@property (nullable, nonatomic, retain) NSSet<ManagedHashtag *> *hashtags;
@property (nullable, nonatomic, retain) NSSet<ManagedPhotoURL *> *photoURLs;
@property (nullable, nonatomic, retain) NSSet<ManagedURL *> *urls;

@end

@interface ManagedTweet (CoreDataGeneratedAccessors)

- (void)addHashtagsObject:(ManagedHashtag *)value;
- (void)removeHashtagsObject:(ManagedHashtag *)value;
- (void)addHashtags:(NSSet<ManagedHashtag *> *)values;
- (void)removeHashtags:(NSSet<ManagedHashtag *> *)values;

- (void)addPhotoURLsObject:(ManagedPhotoURL *)value;
- (void)removePhotoURLsObject:(ManagedPhotoURL *)value;
- (void)addPhotoURLs:(NSSet<ManagedPhotoURL *> *)values;
- (void)removePhotoURLs:(NSSet<ManagedPhotoURL *> *)values;

- (void)addUrlsObject:(ManagedURL *)value;
- (void)removeUrlsObject:(ManagedURL *)value;
- (void)addUrls:(NSSet<ManagedURL *> *)values;
- (void)removeUrls:(NSSet<ManagedURL *> *)values;

@end

NS_ASSUME_NONNULL_END
