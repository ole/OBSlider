//
//  OBSliderDemoAppDelegate.h
//  OBSliderDemo
//
//  Created by Ole Begemann on 03.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBSliderDemoViewController;

@interface AppController : UIResponder <UIApplicationDelegate> 

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet OBSliderDemoViewController *viewController;

@end
