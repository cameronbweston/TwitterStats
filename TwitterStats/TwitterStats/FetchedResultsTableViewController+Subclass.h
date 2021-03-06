//
//  FetchResultsTableViewController+Subclass.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsTableViewController.h"
@import CoreData;

@interface FetchedResultsTableViewController (SubclassInterface) <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (NSFetchRequest *)fetchRequest;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
