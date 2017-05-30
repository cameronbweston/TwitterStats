//
//  CentralDataProcessorController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ManagedTweet;
@class FetchedResultsDataProcessor;
@import CoreData;

@protocol CentralDataProcessorControllerDelegate <NSObject>
- (void)configureCell:(UITableViewCell *)cell forTweet:(ManagedTweet *)tweet;
- (void)processor:(FetchedResultsDataProcessor *)processor didChangeTopTweet:(ManagedTweet *)tweet
      atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
     newIndexPath:(NSIndexPath *)newIndexPath;
@end

@interface FetchedResultsDataProcessor : NSObject

@property (weak, nonatomic) id <CentralDataProcessorControllerDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

@end
