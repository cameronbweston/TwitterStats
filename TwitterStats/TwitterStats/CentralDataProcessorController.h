//
//  CentralDataProcessorController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;

@protocol FetchedResultsControllerDataSourceDelegate

@end

@interface CentralDataProcessorController : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate,
UITableViewDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, weak) id<FetchedResultsControllerDataSourceDelegate> delegate;
@property (nonatomic, strong) UITableView *tableView;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context andTableView:(UITableView *)tableView NS_DESIGNATED_INITIALIZER;

@end
