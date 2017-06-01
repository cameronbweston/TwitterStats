//
//  CentralDataProcessorController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsDataProcessor.h"
#import "Tweet+CoreDataClass.h"

@interface FetchedResultsDataProcessor () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong, readwrite) NSArray<ManagedURL *> *topURLs;

@end

@implementation FetchedResultsDataProcessor

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    if (self = [super init]) {
        self.managedObjectContext = context;
        [self performFetch];
    }
    return self;
}

- (void)performFetch {
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
    NSError * __autoreleasing error = nil;
    BOOL fetched = [self.fetchedResultsController performFetch:&error];
    
    if (!fetched) {
        NSLog(@"Failed to fetchResults: %@\n%@", error.localizedDescription, error.userInfo);
        abort();
    }
}

- (NSFetchRequest *)fetchRequest {
    NSString *tweetEntityName = @"Tweet";
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:tweetEntityName];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"text" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    
    return request;
}

#pragma mark - FetchedResultsControler Delegate 

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {

    self.topURLs = [self findTopURLs];
    [self.delegate didUpdateTopURLs];
}

- (NSArray<ManagedURL*> *)findTopURLs {
    NSMutableArray *allURLs = [self allURLs];

    NSCountedSet * __block countedSet = [[NSCountedSet alloc] initWithArray:allURLs];
    
    [allURLs sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSUInteger obj1Count = [countedSet countForObject:obj1];
        NSUInteger obj2Count = [countedSet countForObject:obj2];
        
        if (obj1Count > obj2Count) {
            return NSOrderedAscending;
        }
        else if (obj1Count < obj2Count) {
            return NSOrderedDescending;
        }
        else {
            return NSOrderedSame;
        }
    }];
    return allURLs;
}

- (NSMutableArray *)allURLs {
    NSArray *allTweets = self.fetchedResultsController.fetchedObjects;
    NSMutableArray *allURLs = [NSMutableArray new];
    
    for (Tweet *tweet in allTweets) {
        [allURLs addObjectsFromArray:tweet.relationshipURL.allObjects];
    }
    
    return allURLs.copy;
}

- (NSArray<ManagedURL *> *)topURLs {
    return [_topURLs subarrayWithRange:NSMakeRange(0, self.resultSize)];
}

@end
