//
//  HashtagTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "HashtagTableViewController.h"
#import "ManagedHashtag+CoreDataClass.h"

@implementation HashtagTableViewController

#pragma mark - Override 

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Top Hashtags";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hashtag"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];

    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ManagedHashtag *hashtag = [self.fetchedResultsController objectAtIndexPath:indexPath];

    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];

    NSInteger rowNumber = indexPath.row + 1;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@", rowNumber, hashtag.text];
}

@end
