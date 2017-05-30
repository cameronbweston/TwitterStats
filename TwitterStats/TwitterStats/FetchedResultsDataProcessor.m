//
//  CentralDataProcessorController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsDataProcessor.h"
#import "ManagedTweet.h"

@interface FetchedResultsDataProcessor () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

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

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
        {
            ManagedTweet *tweet = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
            [self.delegate configureCell:cell forTweet:tweet];
        }
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
