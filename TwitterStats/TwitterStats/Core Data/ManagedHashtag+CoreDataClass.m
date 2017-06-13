//
//  ManagedHashtag+CoreDataClass.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedHashtag+CoreDataClass.h"
#import "ManagedTweet+CoreDataClass.h"

@implementation ManagedHashtag

+ (ManagedHashtag *)findOrCreateHashtagWithText:(NSString *)text andContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hashtag"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"text == %@", text];
    
    NSArray<ManagedHashtag *> *hashtags = [context executeFetchRequest:fetchRequest error:nil];
    
    if (hashtags.count >= 1) {
        return hashtags.firstObject;
    }
    
    ManagedHashtag *singleHashtag =  [NSEntityDescription insertNewObjectForEntityForName:@"Hashtag"
                                                                     inManagedObjectContext:context];
    singleHashtag.text = text;
    return singleHashtag;
}

@end
