//
//  AppDelegate.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"
#import "EverImpressViewController.h"
#import "MapViewController.h"
#import "ToolsViewController.h"
#import "HelpViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Override point for customization after application launch.
	//children view controller
	//1
	 self.welcomeViewController = [[WelcomeViewController alloc]
													  initWithNibName:@"WelcomeViewController" bundle:nil];
	UINavigationController *welecome = [[UINavigationController alloc]
										initWithRootViewController:self.welcomeViewController];
	welecome.navigationBar.tintColor = [UIColor colorWithRed:200.00f/255.0f green:0 blue:0 alpha:.9];
	//2
	self.everImpressViewController = [[EverImpressViewController alloc]
															initWithNibName:@"EverImpressViewController" bundle:nil];
	UINavigationController *everImpress = [[UINavigationController alloc]
										   initWithRootViewController:self.everImpressViewController];
	
	//3
	self.mapViewController = [[MapViewController alloc]
											initWithNibName:@"MapViewController"
											bundle:nil];
	UINavigationController *map = [[UINavigationController alloc]
								   initWithRootViewController:self.mapViewController];
	
	//4
	self.toolsViewController = [[ToolsViewController alloc]
												initWithNibName:@"ToolsViewController"
												bundle:nil];
	UINavigationController *tools = [[UINavigationController alloc]
									 initWithRootViewController:self.toolsViewController];
	
	//5
	self.helpViewController = [[HelpViewController alloc]
											  initWithNibName:@"HelpViewController"
											  bundle:nil];
	UINavigationController *help = [[UINavigationController alloc]
									initWithRootViewController:self.helpViewController];
	
	//tabBar
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:
											 welecome,
											 everImpress,
											 map,
											 tools,
											 help,nil];
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
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
