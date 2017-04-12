//
//  AppDelegate.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "PersistentStack.h"
#import "FetchTweetsWebService.h"
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
    [self.tweetHandler storeTweets];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MasterViewController *masterViewController = [MasterViewController new];
    UINavigationController *rootNavController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    
    self.window.rootViewController = rootNavController;
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
