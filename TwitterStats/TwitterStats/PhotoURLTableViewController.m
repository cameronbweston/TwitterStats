//
//  PhotoURLTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "PhotoURLTableViewController.h"
#import "ManagedPhotoURL+CoreDataClass.h"

@implementation PhotoURLTableViewController

#pragma mark - Table view data source

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top Photo URLs";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PhotoURL"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    request.fetchLimit = 10;
    
    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ManagedPhotoURL *photoURL = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    NSInteger rowNumber = indexPath.row + 1;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@ count: %lld", rowNumber, photoURL.text, photoURL.count];
}

@end
