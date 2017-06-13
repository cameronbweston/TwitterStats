//
//  ManagedPhotoURL+CoreDataClass.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedPhotoURL+CoreDataClass.h"
#import "ManagedTweet+CoreDataClass.h"

@implementation ManagedPhotoURL

+ (ManagedPhotoURL *)findOrCreatePhotoURLWithText:(NSString *)text andContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"PhotoURL"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"text == %@", text];
    
    NSArray<ManagedPhotoURL *> *photoURLs = [context executeFetchRequest:fetchRequest error:nil];
    
    if (photoURLs.count >= 1) {
        return photoURLs.firstObject;
    }
    
    ManagedPhotoURL *singleURL =  [NSEntityDescription insertNewObjectForEntityForName:@"PhotoURL"
                                                     inManagedObjectContext:context];
    singleURL.text = text;
    return singleURL;
}

@end
