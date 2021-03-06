//
//  AppDelegate.m
//  Tests
//
//  Created by Damien CORNU on 24/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "AppDelegate.h"

#import "SoundsListViewController.h"
#import "MyMapViewController.h"
#import "MyMapViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

//    for (NSString *familyName in [UIFont familyNames]) {
//        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
//            NSLog(@"%@", fontName);
//        }
//    }

    // Init datas
    self.plistArray = [[NSMutableArray alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/Sounds-List.plist", [[NSBundle mainBundle] resourcePath]]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // Init main views
    self.searchViewController = [[SoundsListViewController alloc] init];
    self.searchViewController.plistArray = self.plistArray;
    self.mapViewController = [[MyMapViewController alloc] init];
    self.mapViewController.title = @"Map";
    self.mapViewController.plistArray = self.plistArray;
    
    // Wrap into nav controller
    self.mapNavController = [[UINavigationController alloc] initWithRootViewController:self.mapViewController];
    [self.mapNavController setNavigationBarHidden:YES];
//    self.mapNavController.tabBarItem.image = [UIImage imageNamed:@"tab-map.png"];
    self.mapNavController.title = @"Map";
    self.searchNavController = [[UINavigationController alloc] initWithRootViewController:self.searchViewController];
    [self.searchNavController setNavigationBarHidden:YES];
//    self.searchNavController.tabBarItem.image = [UIImage imageNamed:@"tab-search.png"];
    self.searchNavController.title = @"Search";
    
    // Put it in a TabBar controlleer
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController setViewControllers:@[self.mapNavController, self.searchNavController]];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
