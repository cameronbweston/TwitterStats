//
//  EmojiTableViewController.m
//  TwitterStats
//
//  Created by Cameron Weston on 5/4/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "EmojiTableViewController.h"
#import "FetchedResultsDataProcessor.h"


@interface EmojiTableViewController ()
@property (strong, nonatomic) FetchedResultsDataProcessor *processor;
@end

@implementation EmojiTableViewController

#pragma mark - Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.processor = [[FetchedResultsDataProcessor alloc] initWithManagedObjectContext:self.context];
    self.title = @"Top Emojis";
}

@end
