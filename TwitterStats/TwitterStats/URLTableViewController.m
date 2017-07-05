//
//  URLTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "URLTableViewController.h"
#import "ManagedURL+CoreDataClass.h"

@implementation URLTableViewController

#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top URLs";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"URL"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    request.fetchLimit = 10;
    
    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ManagedURL *url = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    NSInteger rowNumber = indexPath.row + 1;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@ count: %lld", (long)rowNumber, url.text, url.count];
}

@end
