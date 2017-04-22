//
//  FetchTweetsWebService.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STTwitterAPI.h"

@interface FetchTweetsWebService : NSObject

- (void)fetchTweetsWithProgressBlock:(void(^)(NSDictionary *json, STTwitterStreamJSONType type))progressBlock errorBlock:(void(^)(NSError *))errorBlock;
- (void)closeStream;

@end
