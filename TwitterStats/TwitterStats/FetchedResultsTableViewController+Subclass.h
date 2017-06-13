//
//  FetchResultsTableViewController+Subclass.h
//  TwitterStats
//
//  Created by Cameron Weston on 6/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsTableViewController.h"

@interface FetchedResultsTableViewController (SubclassInterface)

- (NSFetchRequest *)fetchRequest;
- (NSInteger)fetchCount;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
