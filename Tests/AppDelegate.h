//
//  AppDelegate.h
//  Tests
//
//  Created by Damien CORNU on 24/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundsListViewController;
@class MyMapViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *plistArray;

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *soundsNavController;
@property (strong, nonatomic) SoundsListViewController *soundsViewController;

@property (strong, nonatomic) MyMapViewController *mapViewController;

@end
