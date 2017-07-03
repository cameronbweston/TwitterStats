//
//  EmojiTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/4/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "EmojiTableViewController.h"
#import "Emoji+CoreDataClass.h"
#import "NSString+Emoji.h"

@implementation EmojiTableViewController

#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Top Emojis";
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Emoji"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"count" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"text != nil"];
    request.fetchLimit = 10;
    
    return request;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Emoji *emoji = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSString *emojiImageString = [emoji.text stringByReplacingEmojiCheatCodesWithUnicode];
    NSString *emojiName = [emoji.text stringByReplacingOccurrencesOfString:@":" withString:@""];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    NSInteger rowNumber = indexPath.row + 1;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@ %@ count: %lld", rowNumber, emojiImageString, emojiName, emoji.count];
}

@end
