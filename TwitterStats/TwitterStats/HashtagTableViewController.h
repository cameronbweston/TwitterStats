//
//  HashtagTableViewController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsTableViewController+Subclass.h"

@interface HashtagTableViewController : FetchedResultsTableViewController

@property (strong, nonatomic) NSManagedObjectContext *context;

@end
