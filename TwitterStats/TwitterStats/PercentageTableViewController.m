//
//  PercentageTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PercentageTableViewController.h"
#import "ManagedTweet+CoreDataClass.h"
#import "TweetDataProcessor.h"
#import "PercentageTableViewCell.h"

@implementation PercentageTableViewController

static NSString *const reuseIdentifier = @"percentageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"PercentageTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
    
    self.title = @"Top Percentage Of...";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tweet"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"text" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    
    return request;
}

- (void)configureCell:(PercentageTableViewCell *)customCell atIndexPath:(NSIndexPath *)indexPath {
    TweetDataProcessor *tweetDataProcessor = [[TweetDataProcessor alloc] initWithTweets:self.fetchedResultsController.fetchedObjects];
    
    switch (indexPath.row) {
        case 0: {
            double percentageOfTweetsWithEmoji = [tweetDataProcessor percentageOfTweetsContainingEmoji];
            customCell.tweetContainsTextLabel.text = [NSString stringWithFormat:@"Tweets that contain Emoji"];
            customCell.percentageTextLabel.text = [NSString stringWithFormat:@"%.2f %%", percentageOfTweetsWithEmoji];
        } break;
        case 1: {
            double percentageOfTweetsWithURL = [tweetDataProcessor percentageOfTweetsContainingURL];
            customCell.tweetContainsTextLabel.text = [NSString stringWithFormat:@"Tweets that contain URL"];
            customCell.percentageTextLabel.text = [NSString stringWithFormat:@"%.2f %%", percentageOfTweetsWithURL];
        } break;
        case 2: {
            double percentageOfTweetsWithPhotoURL = [tweetDataProcessor percentageOfTweetsContainingPhotoURL];
            customCell.tweetContainsTextLabel.text = [NSString stringWithFormat:@"Tweets that contain Photo"];
            customCell.percentageTextLabel.text = [NSString stringWithFormat:@"%.2f %%", percentageOfTweetsWithPhotoURL];
        } break;
        default:
            break;
    }
}

#pragma mark - UITableView Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PercentageTableViewCell *customCell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [self configureCell:customCell atIndexPath:indexPath];
    
    return customCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
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
