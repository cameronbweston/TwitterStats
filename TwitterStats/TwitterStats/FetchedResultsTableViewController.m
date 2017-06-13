//
//  CentralDataProcessorController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsTableViewController.h"
#import "ManagedTweet+CoreDataClass.h"
#import "ManagedURL+CoreDataClass.h"

#include <unicode/utf8.h>

@interface FetchedResultsTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong, readwrite) NSArray<ManagedURL *> *topURLs;
@property (nonatomic, strong, readwrite) NSArray<ManagedPhotoURL *> *topPhotoURLs;
@property (nonatomic, strong, readwrite) NSArray<ManagedHashtag *> *topHashtags;
@property (nonatomic, strong, readwrite) NSArray<ManagedTweet *> *topEmojis;

@end

@implementation FetchedResultsDataProcessor

static const NSInteger fetchCount = 10;

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

- (void)configureFetchedResultsControllerForEntityName:(NSString *)entity {
    [self.managedObjectContext setStalenessInterval:0];
    
    NSFetchRequest *const fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entity];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:NO]];
    fetchRequest.fetchLimit = fetchCount;
    
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
    
    NSError * __autoreleasing error;
    const BOOL fetched = [self.fetchedResultsController performFetch:&error];
    if (!fetched) {
        NSLog(@"Failed to preform fetch: %@", error.localizedDescription);
    }
}

#pragma mark - FetchedResultsControler Delegate

- (NSArray<ManagedTweet*> *)findTopEmojis {
    NSMutableArray *allText = [self allText];
    //NSMutableArray *allUnicode = [NSMutableArray new];
    
    return allText;
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

- (NSArray<ManagedPhotoURL*> *)findTopPhotoURLs {
    NSMutableArray *allPhotoURLs = [self allPhotoURLs];
    
    NSCountedSet * __block countedSet = [[NSCountedSet alloc] initWithArray:allPhotoURLs];
    
    [allPhotoURLs sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
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
    return allPhotoURLs;
}

- (NSArray<ManagedHashtag*> *)findTopHashtags {
    NSMutableArray *allHashtags = [self allHashtags];
    
    NSCountedSet * __block countedSet = [[NSCountedSet alloc] initWithArray:allHashtags];
    
    [allHashtags sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
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
    return allHashtags;
}

- (NSMutableArray *)allText {
    NSArray *allTweets = self.fetchedResultsController.fetchedObjects;
    NSMutableArray *allText = [NSMutableArray new];
    
    for (ManagedTweet *tweet in allTweets) {
        [allText addObject:tweet.text];
    }
    
    return allText.copy;
}

- (NSMutableArray *)allURLs {
    NSArray *allTweets = self.fetchedResultsController.fetchedObjects;
    NSMutableArray *allURLs = [NSMutableArray new];
    
    for (ManagedTweet *tweet in allTweets) {
        [allURLs addObjectsFromArray:tweet.urls.allObjects];
    }
    
    return allURLs.copy;
}

- (NSMutableArray *)allPhotoURLs {
    NSArray *allTweets = self.fetchedResultsController.fetchedObjects;
    NSMutableArray *allPhotoURLs = [NSMutableArray new];
    
    for (ManagedTweet *tweet in allTweets) {
        [allPhotoURLs addObjectsFromArray:tweet.photoURLs.allObjects];
    }
    
    return allPhotoURLs.copy;
}

- (NSMutableArray *)allHashtags {
    NSArray *allTweets = self.fetchedResultsController.fetchedObjects;
    NSMutableArray *allHashtags = [NSMutableArray new];
    
    for (ManagedTweet *tweet in allTweets) {
        [allHashtags addObjectsFromArray:tweet.hashtags.allObjects];
    }
    
    return allHashtags.copy;
}

- (NSArray<ManagedURL *> *)topURLs {
    return [_topURLs subarrayWithRange:NSMakeRange(0, self.resultSize)];
}

- (NSArray<ManagedPhotoURL *> *)topPhotoURLs {
    return [_topPhotoURLs subarrayWithRange:NSMakeRange(0, self.resultSize)];
}

- (NSArray<ManagedHashtag *> *)topHashtags {
    return [_topHashtags subarrayWithRange:NSMakeRange(0, self.resultSize)];
}

#pragma mark - Helpers

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ManagedURL *url = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    NSInteger rowNumber = indexPath.row + 1;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", rowNumber, url.text];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return fetchCount;
}

#pragma mark - NSFetchedResultsController Delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
