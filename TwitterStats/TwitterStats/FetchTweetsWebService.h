//
//  FetchTweetsWebService.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FetchTweetsWebService : NSObject

@property (nonatomic, strong, readwrite) NSString *oAuthToken;
- (void)fetchBearerToken;
- (void)fetchTweets:(void (^)(NSDictionary *data))callback;

@end
