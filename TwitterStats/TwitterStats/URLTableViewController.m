//
//  URLTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "URLTableViewController.h"
#import "FetchedResultsDataProcessor.h"
#import "ManagedURL+CoreDataClass.h"

@interface URLTableViewController () <CentralDataProcessorControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) FetchedResultsDataProcessor *processor;

@end

@implementation URLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.processor = [[FetchedResultsDataProcessor alloc] initWithManagedObjectContext:self.context];
    self.processor.delegate = self;
    self.processor.resultSize = 10;
    self.title = @"Top URLs";
    self.tableView.dataSource = self;
    self.tableView.alwaysBounceVertical = YES;
}

- (void)didUpdateTopItems {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long rowNumber = indexPath.row + 1;
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    ManagedURL *url = self.processor.topURLs[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", rowNumber, url.text];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.processor.topURLs.count;
}

@end
