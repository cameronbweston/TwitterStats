//
//  JSONTweetObject.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/25/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "JSONTweetObject.h"

@implementation JSONTweetObject

- (instancetype)initWithJSONObject:(__kindof NSObject *)jsonObject {
    if (self = [super init]) {
        [self loadFromDictionary:jsonObject];
    }
    return self;
}

- (void)loadFromDictionary:(NSDictionary *)jsonTweet {
    //array items here for testing
        [self validateStringValueForKey:@"id_str" fromDicitonary:jsonTweet block:^(NSString *stringValue) {
            self.tweetID = stringValue;
        }];

        NSArray *item2 = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"hashtags"];
        NSArray *item3 = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"symbols"];
        NSArray *item4 = [[jsonTweet valueForKeyPath:@"entities"] valueForKeyPath:@"urls"];
        NSString *item5 = [jsonTweet valueForKeyPath:@"text"];
        NSString *item6 = [jsonTweet valueForKeyPath:@"created_at"];

        self.hashtags = item2;
        self.symbols = item3;
        self.urls = item4;
        self.text = [jsonTweet valueForKeyPath:@"text"];
        self.dateCreated = [jsonTweet valueForKeyPath:@"created_at"];
}

- (BOOL)validateStringValueForKey:(NSString *)key
                   fromDicitonary:(NSDictionary *)dict
                            block:(void (^)(NSString *stringValue))block {
    __kindof NSObject *const jsonValue = dict[key];
    
    const BOOL isString = [jsonValue isKindOfClass:[NSString class]];
    
    if (isString) {
        block(jsonValue);
    }
    
    return isString;
}

- (NSNumber *)validateNumberValueForKey:(NSString *)key
                         fromDicitonary:(NSDictionary *)dict {
    __kindof NSObject *const jsonValue = dict[key];
    NSNumber *resultNumber;
    
    if ([jsonValue isKindOfClass:[NSNumber class]]) {
        resultNumber = jsonValue;
    }
    else if ([jsonValue isKindOfClass:[NSString class]]) {
        NSNumber *const numberValue = [NSDecimalNumber decimalNumberWithString:jsonValue];
        
        if (nil != numberValue && ! [numberValue isEqualToNumber:[NSDecimalNumber notANumber]]) {
            resultNumber = numberValue;
        }
    }
    
    return resultNumber;
}

@end
