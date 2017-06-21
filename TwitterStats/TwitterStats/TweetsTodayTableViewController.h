//
//  TweetsTodayTableViewController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/12/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TweetsTodayTableViewController : UITableViewController

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

@end
