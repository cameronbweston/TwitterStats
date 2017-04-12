//
//  ManagedTweet.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ManagedTweet : NSManagedObject

- (void)loadFromDictionary:(NSDictionary *)dictionary;
+ (ManagedTweet *)findOrCreateTweetWithIdentifier:(NSString *)identifier
                                        inContext:(NSManagedObjectContext *)context;

@end
