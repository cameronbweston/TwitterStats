//
//  HashtagTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "HashtagTableViewController.h"
#import "ManagedHashtag+CoreDataClass.h"
#import "HashtagTableViewCell.h"

@implementation HashtagTableViewController

static NSString *const reuseIdentifier = @"hashtagCell";

#pragma mark - Override 

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Top Hashtags";
    
    UINib *nib = [UINib nibWithNibName:@"HashtagTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hashtag"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    request.fetchLimit = 10;
    
    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ManagedHashtag *hashtag = [self.fetchedResultsController objectAtIndexPath:indexPath];
    HashtagTableViewCell *customCell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    customCell.hashtagTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    customCell.hashtagTextLabel.numberOfLines = 0;
    customCell.hashtagTextLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];

    NSInteger rowNumber = indexPath.row + 1;
    customCell.rowNumberTextLabel.text = [NSString stringWithFormat:@"%ld.", rowNumber];
    customCell.hashtagTextLabel.text = [NSString stringWithFormat:@"%@", hashtag.text];
}

@end
