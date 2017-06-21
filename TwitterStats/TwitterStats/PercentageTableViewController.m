//
//  PercentageTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PercentageTableViewController.h"
#import "ManagedTweet+CoreDataClass.h"

@implementation PercentageTableViewController

NSInteger tweetsContainingEmoji;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top Percentage of...";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tweet"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"text" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    //request.fetchLimit = 10;
    
    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger tweetsContainingEmoji = 0;
    NSInteger tweetsContainingURL = 0;
    NSInteger tweetsContainingPhotoURL = 0;
    
    for (ManagedTweet *tweet in self.fetchedResultsController.fetchedObjects) {
        if (tweet.containsEmoji == YES) {
            tweetsContainingEmoji += 1;
        }
        else if (tweet.containsURL == YES) {
            tweetsContainingURL += 1;
        }
        else if (tweet.containsPhotoURL == YES) {
            tweetsContainingPhotoURL += 1;
        }
    }
    double percentageOfTweetsWithEmoji = (double)tweetsContainingEmoji / self.fetchedResultsController.fetchedObjects.count * 100;
    double percentageOfTweetsWithURL = (double)tweetsContainingURL / self.fetchedResultsController.fetchedObjects.count * 100;
    double percentageOfTweetsWithPhotoURL = (double)tweetsContainingPhotoURL / self.fetchedResultsController.fetchedObjects.count * 100;

    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = [NSString stringWithFormat:@"Tweets that contain emoji: %.2f%%", percentageOfTweetsWithEmoji];
        } break;
        case 1: {
            cell.textLabel.text = [NSString stringWithFormat:@"Tweets that contain URL: %.2f%%", percentageOfTweetsWithURL];
        } break;
        case 2: {
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
