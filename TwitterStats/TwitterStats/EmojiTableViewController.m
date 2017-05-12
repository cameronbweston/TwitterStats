//
//  EmojiTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/4/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "EmojiTableViewController.h"
#import "CentralDataProcessorController.h"

@interface EmojiTableViewController () <FetchedResultsControllerDataSourceDelegate, UITableViewDelegate>

@property (nonatomic, strong) CentralDataProcessorController *DataProcessorControllerDataSource;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation EmojiTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.DataProcessorControllerDataSource =
    [[CentralDataProcessorController alloc] initWithManagedObjectContext:self.context andTableView:self.tableView];
    self.DataProcessorControllerDataSource.delegate = self;
    
    self.tableView.delegate = self.DataProcessorControllerDataSource;
    self.tableView.dataSource = self.DataProcessorControllerDataSource;
    
    self.navigationItem.title = @"Top Emojis";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

@end
