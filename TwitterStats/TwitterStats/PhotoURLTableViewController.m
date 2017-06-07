//
//  PhotoURLTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PhotoURLTableViewController.h"
#import "FetchedResultsDataProcessor.h"
#import "ManagedPhotoURL+CoreDataProperties.h"

@interface PhotoURLTableViewController () <CentralDataProcessorControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) FetchedResultsDataProcessor *processor;

@end

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

- (void)didUpdateTopItems {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long rowNumber = indexPath.row + 1;
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    ManagedPhotoURL *photoURL = self.processor.topPhotoURLs[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", rowNumber, photoURL.text];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.processor.topPhotoURLs.count;
}

@end
