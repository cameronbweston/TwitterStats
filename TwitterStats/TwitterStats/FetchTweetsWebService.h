//
//  FetchTweetsWebService.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AnyPromise;

@interface FetchTweetsWebService : NSObject

- (AnyPromise *)fetchBearerToken;
- (void)fetchTweetsUsingToken:(NSString *)token callBlock:(void (^)(NSDictionary *))callback;

@end
