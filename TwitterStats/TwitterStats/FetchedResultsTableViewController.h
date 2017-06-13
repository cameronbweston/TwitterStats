//
//  CentralDataProcessorController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ManagedURL;
@class ManagedPhotoURL;
@class ManagedHashtag;
@class FetchedResultsTableViewController;
@import CoreData;

@protocol CentralDataProcessorControllerDelegate <NSObject>

- (void)didUpdateTopItems;

@end

@interface FetchedResultsTableViewController : UITableViewController

@property (weak, nonatomic) id <CentralDataProcessorControllerDelegate> delegate;
@property (strong, nonatomic, readonly) NSArray<ManagedURL *> *topURLs;
@property (strong, nonatomic, readonly) NSArray<ManagedPhotoURL *> *topPhotoURLs;
@property (strong, nonatomic, readonly) NSArray<ManagedHashtag *> *topHashtags;
@property (assign, nonatomic) NSInteger resultSize;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;
- (void)configureFetchedResultsControllerForEntityName:(NSString *)entity;

@end
