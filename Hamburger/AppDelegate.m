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
    
    hamburgerViewController.vanityViewController = [[UIViewController alloc] init];
    CGRect vanityFrame = hamburgerViewController.view.frame;
    NSInteger vanityWidth = hamburgerViewController.view.frame.size.width * 0.05f;
    vanityFrame.size.width = vanityWidth;
    vanityFrame.origin.x = hamburgerViewController.view.frame.size.width;
    hamburgerViewController.vanityFrameOutView = vanityFrame;
    vanityFrame.origin.x = hamburgerViewController.view.frame.size.width - vanityWidth + 1.0f;
    hamburgerViewController.vanityFrameInView = vanityFrame;
    
    hamburgerViewController.backViewController.view.frame = hamburgerViewController.view.frame;
    hamburgerViewController.vanityViewController.view.frame = hamburgerViewController.vanityFrameInView;
    
    [hamburgerViewController addChildVC:hamburgerViewController.vanityViewController];
    [hamburgerViewController addChildVC:hamburgerViewController.frontViewController];
    
    [hamburgerViewController.vanityViewController.view setBackgroundColor:hamburgerViewController.frontViewController.view.backgroundColor];
    
    hamburgerViewController.backViewController.view.frame = hamburgerViewController.view.frame;
    hamburgerViewController.frontViewController.view.frame = hamburgerViewController.view.frame;

    return YES;
}

@end
