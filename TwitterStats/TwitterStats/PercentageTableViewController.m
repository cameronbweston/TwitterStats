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

@implementation PercentageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top Percentage Of...";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tweet"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"text" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    
    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    TweetDataProcessor *tweetDataProcessor = [[TweetDataProcessor alloc] initWithTweets:self.fetchedResultsController.fetchedObjects];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    switch (indexPath.row) {
        case 0: {
            double percentageOfTweetsWithEmoji = [tweetDataProcessor percentageOfTweetsContainingEmoji];
            cell.textLabel.text = [NSString stringWithFormat:@"Tweets that contain emoji: %.2f%%", percentageOfTweetsWithEmoji];
        } break;
        case 1: {
            double percentageOfTweetsWithURL = [tweetDataProcessor percentageOfTweetsContainingURL];
            cell.textLabel.text = [NSString stringWithFormat:@"Tweets that contain URL: %.2f%%", percentageOfTweetsWithURL];
        } break;
        case 2: {
            double percentageOfTweetsWithPhotoURL = [tweetDataProcessor percentageOfTweetsContainingPhotoURL];
            cell.textLabel.text = [NSString stringWithFormat:@"Tweets that contain a Photo: %.2f%%", percentageOfTweetsWithPhotoURL];
        } break;
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
