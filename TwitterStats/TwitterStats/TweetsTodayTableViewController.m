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
#import "TweetsTodayTableViewCell.h"

@interface TweetsTodayTableViewController ()<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation TweetsTodayTableViewController

static NSString *const reuseIdentifier = @"tweetsTodayCell";

#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Tweets Today";
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

- (void)configureCell:(TweetsTodayTableViewCell *)customCell atIndexPath:(NSIndexPath *)indexPath {
    TweetDataProcessor *tweetDataProcessor = [[TweetDataProcessor alloc] initWithTweets:self.fetchedResultsController.fetchedObjects];
    
    switch (indexPath.row) {
        case 0: {
            customCell.customCellTextLabel.text = [NSString stringWithFormat:@"Total number of tweets collected"];
            customCell.numbersLabel.text = [NSString stringWithFormat:@"%lu", self.fetchedResultsController.fetchedObjects.count];
        } break;
        case 1: {
            customCell.customCellTextLabel.text = [NSString stringWithFormat:@"Average tweets per second"];
            customCell.numbersLabel.text = [NSString stringWithFormat:@"%.0f", tweetDataProcessor.averageTweetsPerSecond];
        } break;
        case 2: {
            customCell.customCellTextLabel.text = [NSString stringWithFormat:@"Average tweets per minute"];
            customCell.numbersLabel.text = [NSString stringWithFormat:@"%.0f", tweetDataProcessor.averageTweetsPerMinute];
        } break;
        case 3: {
            customCell.customCellTextLabel.text = [NSString stringWithFormat:@"Average tweets per hour"];
            customCell.numbersLabel.text = [NSString stringWithFormat:@"%.0f", tweetDataProcessor.averageTweetsPerHour];
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
    UINib *nib = [UINib nibWithNibName:@"TweetsTodayTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
    self.tableView.alwaysBounceVertical = YES;
    self.tableView.dataSource = self;
}

#pragma mark - UITableView Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetsTodayTableViewCell *customCell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [self configureCell:customCell atIndexPath:indexPath];
    
    return customCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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
