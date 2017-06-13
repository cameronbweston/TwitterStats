//
//  PercentageTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PercentageTableViewController.h"

@implementation PercentageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.processor.delegate = self;
    //self.processor.resultSize = 10;
    self.title = @"% of Tweets That...";
    //self.tableView.dataSource = self;
    self.tableView.alwaysBounceVertical = YES;
}

@end
