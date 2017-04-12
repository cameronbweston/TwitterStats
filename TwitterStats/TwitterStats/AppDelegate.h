//
//  AppDelegate.h
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersistentStack;
@class FetchTweetsWebService;
@class TweetHandler;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PersistentStack *persistentStack;
@property (strong, nonatomic) FetchTweetsWebService *tweetWebservice;

@end

