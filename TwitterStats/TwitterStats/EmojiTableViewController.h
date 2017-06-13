//
//  EmojiTableViewController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/4/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchedResultsTableViewController+Subclass.h"

@interface EmojiTableViewController : FetchedResultsTableViewController

@property (strong, nonatomic) NSManagedObjectContext *context;

@end
