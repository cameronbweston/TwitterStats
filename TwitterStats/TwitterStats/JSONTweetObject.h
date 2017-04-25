//
//  JSONTweetObject.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/25/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONTweetObject : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithJSONObject:(__kindof NSObject *)jsonObject NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong) NSDate *dateCreated;
@property (nonatomic, strong) NSString *tweetID;
@property (nonatomic, strong) NSString *hashtags;
@property (nonatomic, strong) NSString *symbols;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *urls;
@property (nonatomic, strong) NSString *emojis;

@end
