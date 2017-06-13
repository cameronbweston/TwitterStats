//
//  ManagedURL+CoreDataClass.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ManagedTweet;

NS_ASSUME_NONNULL_BEGIN

@interface ManagedURL : NSManagedObject

+ (ManagedURL *)findOrCreateURLWithText:(NSString *)text andContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "ManagedURL+CoreDataProperties.h"
