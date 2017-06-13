//
//  PhotoURLTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PhotoURLTableViewController.h"

@implementation PhotoURLTableViewController

#pragma mark - Table view data source

- (void)viewDidLoad {
    [super viewDidLoad];
    self.processor = [[FetchedResultsDataProcessor alloc] initWithManagedObjectContext:self.context];
    self.processor.delegate = self;
    self.processor.resultSize = 10;
    self.title = @"Top Photo URLs";
    self.tableView.dataSource = self;
    self.tableView.alwaysBounceVertical = YES;
}

@end
