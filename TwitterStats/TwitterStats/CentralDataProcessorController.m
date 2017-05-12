//
//  CentralDataProcessorController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "CentralDataProcessorController.h"
#import "ManagedTweet.h"

@implementation CentralDataProcessorController

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context andTableView:(UITableView *)tableView {
    self.managedObjectContext = context;
    self.tableView = tableView;
    return self;
}

- (void)performFetch {
    NSString *tweetEntityName = [[ManagedTweet entity] name];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:tweetEntityName];
    NSManagedObjectContext *moc = self.managedObjectContext;
    
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                          managedObjectContext:moc
                                                                            sectionNameKeyPath:nil
                                                                                     cacheName:nil]];
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to fetchResults: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    [[self fetchedResultsController] setDelegate:self];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *genericCell = [[UITableViewCell alloc] init];
    return genericCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[[self fetchedResultsController] sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}
@end
