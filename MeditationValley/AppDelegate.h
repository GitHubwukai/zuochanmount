//
//  AppDelegate.h
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WelcomeViewController;
@class EverImpressViewController;
@class MapViewController;
@class ToolsViewController;
@class HelpViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) WelcomeViewController *welcomeViewController;
@property (strong, nonatomic) EverImpressViewController *everImpressViewController;
@property (strong, nonatomic) MapViewController *mapViewController;
@property (strong, nonatomic) ToolsViewController *toolsViewController;
@property (strong, nonatomic) HelpViewController *helpViewController;

@end
