//
//  ManagedURL+CoreDataClass.m
//  TwitterStats
//
//  Created by Cameron Weston on 6/7/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "ManagedURL+CoreDataClass.h"
#import "ManagedTweet+CoreDataClass.h"

@implementation ManagedURL

+ (ManagedURL *)findOrCreateURLWithText:(NSString *)text andContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"URL"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"text == %@", text];
    
    NSArray<ManagedURL *> *urls = [context executeFetchRequest:fetchRequest error:nil];
    
    if (urls.count >= 1) {
        return urls.firstObject;
    }
    
    ManagedURL *url =  [NSEntityDescription insertNewObjectForEntityForName:@"URL"
                                                     inManagedObjectContext:context];
    url.text = text;
    return url;
}

@end
