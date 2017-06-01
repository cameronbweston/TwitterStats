//
//  CentralDataProcessorController.h
//  TwitterStats
//
//  Created by Cameron Weston on 5/9/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ManagedURL;
@class FetchedResultsDataProcessor;
@import CoreData;

@protocol CentralDataProcessorControllerDelegate <NSObject>

- (void)didUpdateTopURLs;

@end

@interface FetchedResultsDataProcessor : NSObject

@property (weak, nonatomic) id <CentralDataProcessorControllerDelegate> delegate;

@property (strong, nonatomic, readonly) NSArray<ManagedURL *> *topURLs;

@property (assign, nonatomic) NSInteger resultSize;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

@end
