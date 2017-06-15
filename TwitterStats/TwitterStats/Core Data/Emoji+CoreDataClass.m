//
//  Emoji+CoreDataClass.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/13/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "Emoji+CoreDataClass.h"
#import "ManagedTweet+CoreDataClass.h"

@implementation Emoji

+ (Emoji *)findOrCreateEmojiWithText:(NSString *)text andContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Emoji"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"text == %@", text];
    
    NSArray<Emoji *> *emojisArray = [context executeFetchRequest:fetchRequest error:nil];
    
    if (emojisArray.count >= 1) {
        return emojisArray.firstObject;
    }
    
    Emoji *singleEmoji =  [NSEntityDescription insertNewObjectForEntityForName:@"Emoji"
                                                        inManagedObjectContext:context];
    singleEmoji.text = text;
    return singleEmoji;
}

@end
