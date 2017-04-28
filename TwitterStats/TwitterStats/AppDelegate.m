//
//  AppDelegate.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewController.h"
#import "PersistentStack.h"
#import "TweetHandler.h"

@interface AppDelegate ()

@property (nonatomic, strong) TweetHandler *tweetHandler;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.persistentStack = [[PersistentStack alloc] init];
    self.tweetWebservice = [[FetchTweetsWebService alloc] init];
    self.tweetHandler = [[TweetHandler alloc] initWithContext:self.persistentStack.context
                                              tweetWebservice:self.tweetWebservice];
    
    [self.tweetHandler fetchAndSaveTweets];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CollectionViewController *collectionViewController = [[CollectionViewController alloc] initWithNibName:@"CollectionViewController" bundle:nil];
    UINavigationController *rootNavController = [[UINavigationController alloc] initWithRootViewController:collectionViewController];
    
    self.window.rootViewController = rootNavController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.tweetHandler closeStream];
}


@end
