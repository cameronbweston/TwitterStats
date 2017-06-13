//
//  TweetsTodayTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "TweetsTodayTableViewController.h"

@implementation TweetsTodayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.processor = [[FetchedResultsDataProcessor alloc] initWithManagedObjectContext:self.context];
    //self.processor.delegate = self;
    //self.processor.resultSize = 10;
    self.title = @"Tweets Today";
    //self.tableView.dataSource = self;
    self.tableView.alwaysBounceVertical = YES;
}

@end
