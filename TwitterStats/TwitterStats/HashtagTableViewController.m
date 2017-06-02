//
//  HashtagTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "HashtagTableViewController.h"
#import "FetchedResultsDataProcessor.h"
#import "ManagedHashtag+CoreDataClass.h"

@interface HashtagTableViewController () <CentralDataProcessorControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) FetchedResultsDataProcessor *processor;

@end

@implementation HashtagTableViewController

#pragma mark - Override 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.processor = [[FetchedResultsDataProcessor alloc] initWithManagedObjectContext:self.context];
    self.processor.delegate = self;
    self.processor.resultSize = 10;
    
    self.tableView.dataSource = self;
    self.tableView.alwaysBounceVertical = YES;
}

- (void)didUpdateTopItems {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    ManagedHashtag *hashtag = self.processor.topHashtags[indexPath.row];
    cell.textLabel.text = hashtag.text;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.processor.topHashtags.count;
}

@end
