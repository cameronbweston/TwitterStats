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
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:0.0 green:0.675 blue:0.929 alpha:1], NSForegroundColorAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    self.window.rootViewController = rootNavController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.tweetHandler closeStream];
}


@end
