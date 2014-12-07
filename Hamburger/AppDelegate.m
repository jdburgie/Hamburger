//
//  AppDelegate.m
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *rootViewController = (UINavigationController *)self.window.rootViewController;

    HamburgerViewController *hamburgerViewController = (HamburgerViewController *)rootViewController.topViewController;
   
    UIStoryboard *storyboard = [self.window.rootViewController storyboard];
    
    hamburgerViewController.backViewController = [storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    hamburgerViewController.frontViewController = [storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
    
    [hamburgerViewController addChildVC:hamburgerViewController.backViewController];
    [hamburgerViewController addChildVC:hamburgerViewController.frontViewController];
    
    hamburgerViewController.backViewController.view.frame = hamburgerViewController.view.frame;
    hamburgerViewController.frontViewController.view.frame = hamburgerViewController.view.frame;

    return YES;
}

@end
