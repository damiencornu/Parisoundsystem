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
#import "LeftViewController.h"
#import "AboutViewController.h"
#import "MyMapViewController.h"
#import "IIViewDeckController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Init datas
    self.plistArray = [[NSMutableArray alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/Sounds-List.plist", [[NSBundle mainBundle] resourcePath]]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    // Init main views
    self.leftViewController = [[LeftViewController alloc] init];
    self.aboutViewController = [[AboutViewController alloc] init];
    self.soundsViewController = [[SoundsListViewController alloc] init];
    self.soundsViewController.plistArray = self.plistArray;
    self.mapViewController = [[MyMapViewController alloc] init];
    self.mapViewController.title = @"Map";
    self.mapViewController.plistArray = self.plistArray;
    
    // Wrap into nav controller
    self.aboutNavController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewController];
    self.aboutNavController.navigationBar.tintColor = [UIColor colorWithRed:.7 green:.5 blue:.2 alpha:1];
    self.aboutViewController.title = @"About";
    self.mapNavController = [[UINavigationController alloc] initWithRootViewController:self.mapViewController];
    self.mapNavController.navigationBar.tintColor = [UIColor colorWithRed:.7 green:.5 blue:.2 alpha:1];
    self.mapNavController.title = @"Map";
    self.soundsNavController = [[UINavigationController alloc] initWithRootViewController:self.soundsViewController];
    self.soundsNavController.navigationBar.tintColor = [UIColor colorWithRed:.7 green:.5 blue:.2 alpha:1];
    self.soundsNavController.title = @"Sounds";
    
    // Put it in a TabBar controlleer
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController setViewControllers:@[self.mapNavController, self.soundsNavController]];
    
    IIViewDeckController* deckController = [[IIViewDeckController alloc] initWithCenterViewController:self.tabBarController leftViewController:self.leftViewController];
    
    deckController.panningMode = IIViewDeckNoPanning;
    
    self.mapViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:deckController action:@selector(toggleLeftView)];
    self.soundsViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:deckController action:@selector(toggleLeftView)];
    self.aboutViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:deckController action:@selector(toggleLeftView)];

    
    self.window.rootViewController = deckController;
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
