//
//  OBSliderDemoAppDelegate.m
//  OBSliderDemo
//
//  Created by Ole Begemann on 03.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import "AppController.h"
#import "OBSliderDemoViewController.h"

@implementation AppController

@synthesize window = _window;
@synthesize viewController = _viewController;

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[OBSliderDemoViewController alloc] initWithNibName:@"OBSliderDemoViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
