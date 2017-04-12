//
//  TweetHandler.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/6/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FetchTweetsWebService.h"

@import CoreData;

@interface TweetHandler : NSObject

- (instancetype)initWithContext:(NSManagedObjectContext *)context
      tweetWebservice:(FetchTweetsWebService *)tweetWebservice;
- (void)storeTweets;

@end
