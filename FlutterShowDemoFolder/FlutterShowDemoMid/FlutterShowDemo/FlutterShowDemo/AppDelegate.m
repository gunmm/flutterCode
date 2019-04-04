//
//  AppDelegate.m
//  FlutterShowDemo
//
//  Created by minzhe on 2019/3/22.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h> // Only if you have Flutter Plugins
#import "MainViewController.h"
#import "MyFlutterViewController.h"
#import <Bugly/Bugly.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    MainViewController *mainVc = [[MainViewController alloc] init];
    mainVc.title = @"iOS";
    mainVc.tabBarItem.image = [UIImage imageNamed:@"apple"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVc];
    
    MyFlutterViewController *flutterViewController = [[MyFlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    flutterViewController.title = @"flutter";
    flutterViewController.tabBarItem.image = [UIImage imageNamed:@"flutter"];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:flutterViewController];


    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[nav, nav2];
    self.window.rootViewController = tabVC;
    
    [Bugly startWithAppId:@"e3b091bab6"];

    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    [self.flutterEngine runWithEntrypoint:nil];
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
