//
//  PersistentStack.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PersistentStack.h"

@interface PersistentStack ()

@property (nonatomic, strong, readwrite) NSManagedObjectContext *context;

@end

@implementation PersistentStack

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupManagedObjectContext:self.storeURL];
    }
    return self;
}

- (void)setupManagedObjectContext:(NSURL *)storeURL {
    self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.context.undoManager = [NSUndoManager new];
    self.context.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    NSError *error;
    [self.context.persistentStoreCoordinator
                                             addPersistentStoreWithType:NSSQLiteStoreType
                                                          configuration:nil
                                                                    URL:storeURL
                                                                options:nil
                                                                  error:&error];
    if (error) {
        NSLog(@"Error in setup managed object context: %@", error);
    }
    self.context.undoManager = [NSUndoManager new];
}

- (NSManagedObjectModel*)managedObjectModel {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}

- (NSURL *)storeURL {
    NSURL *documentsDirectory = [[NSFileManager defaultManager]
                                 URLForDirectory:NSDocumentDirectory
                                        inDomain:NSUserDomainMask
                               appropriateForURL:nil
                                          create:YES
                                           error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"tweetDatabase.sqlite"];
}

- (NSURL *)modelURL {
    return [[NSBundle mainBundle] URLForResource:@"TwitterStatsModel" withExtension:@"momd"];
}

@end
