//
//  Tweet+CoreDataProperties.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/1/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "Tweet+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Tweet (CoreDataProperties)

+ (NSFetchRequest<Tweet *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dateCreated;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, copy) NSString *tweetID;
@property (nullable, nonatomic, retain) NSSet<ManagedHashtag *> *relationshipHashtag;
@property (nullable, nonatomic, retain) NSSet<ManagedPhotoURL *> *relationshipPhotoURL;
@property (nullable, nonatomic, retain) NSSet<ManagedURL *> *relationshipURL;

@end

@interface Tweet (CoreDataGeneratedAccessors)

- (void)addRelationshipHashtagObject:(ManagedHashtag *)value;
- (void)removeRelationshipHashtagObject:(ManagedHashtag *)value;
- (void)addRelationshipHashtag:(NSSet<ManagedHashtag *> *)values;
- (void)removeRelationshipHashtag:(NSSet<ManagedHashtag *> *)values;

- (void)addRelationshipPhotoURLObject:(ManagedPhotoURL *)value;
- (void)removeRelationshipPhotoURLObject:(ManagedPhotoURL *)value;
- (void)addRelationshipPhotoURL:(NSSet<ManagedPhotoURL *> *)values;
- (void)removeRelationshipPhotoURL:(NSSet<ManagedPhotoURL *> *)values;

- (void)addRelationshipURLObject:(ManagedURL *)value;
- (void)removeRelationshipURLObject:(ManagedURL *)value;
- (void)addRelationshipURL:(NSSet<ManagedURL *> *)values;
- (void)removeRelationshipURL:(NSSet<ManagedURL *> *)values;

@end

NS_ASSUME_NONNULL_END
