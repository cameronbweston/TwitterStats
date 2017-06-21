//
//  TweetsTodayTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "TweetsTodayTableViewController.h"
#import "ManagedTweet+CoreDataClass.h"
#import "TweetDataProcessor.h"

@interface TweetsTodayTableViewController ()<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation TweetsTodayTableViewController

static NSString *const reuseIdentifier = @"reuseIdentifier";

#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureFetchedResultsController];
    [self configureTableView];
}

#pragma mark - Initialization

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.managedObjectContext = context;
    }
    
    return self;
}

#pragma mark - Helpers

- (void)configureFetchedResultsController {
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:@"dateCreated"
                                                                                   cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
    NSError * __autoreleasing error = nil;
    BOOL fetched = [self.fetchedResultsController performFetch:&error];
    
    if (!fetched) {
        NSLog(@"Failed to fetchResults: %@\n%@", error.localizedDescription, error.userInfo);
        abort();
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    TweetDataProcessor *tweetDataProcessor = [[TweetDataProcessor alloc] initWithTweets:self.fetchedResultsController.fetchedObjects];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    cell.textLabel.text = [NSString stringWithFormat:@"Filler text"];
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = [NSString stringWithFormat:@"Total number of tweets collected: %lu", self.fetchedResultsController.fetchedObjects.count];
        } break;
        case 1: {
            cell.textLabel.text = [NSString stringWithFormat:@"Average tweets per second: %.0f", tweetDataProcessor.averageTweetsPerSecond];
        } break;
        case 2: {
            cell.textLabel.text = [NSString stringWithFormat:@"Average tweets per minute: %.0f", tweetDataProcessor.averageTweetsPerMinute];
        } break;
        case 3: {
            cell.textLabel.text = [NSString stringWithFormat:@"Average tweets per hour: %.0f", tweetDataProcessor.averageTweetsPerHour];
        } break;
        default:
            break;
    }
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tweet"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"dateCreated" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    
    return request;
}

- (void)configureTableView {
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:reuseIdentifier];
    self.tableView.alwaysBounceVertical = YES;
    self.tableView.dataSource = self;
}

#pragma mark - UITableView Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - NSFetchedResultsController Delegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    [self.tableView reloadData];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
