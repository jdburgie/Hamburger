//
//  HamburgerViewController.h
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HamburgerViewController : UIViewController

@property (strong, nonatomic) UIViewController *backViewController;
@property (strong, nonatomic) UIViewController *frontViewController;
@property (strong, nonatomic) UIViewController *vanityViewController;

@property (assign, nonatomic) CGRect vanityFrameInView;
@property (assign, nonatomic) CGRect vanityFrameOutView;

@property (assign, nonatomic) CGFloat sideViewWidthPercent;

- (void)addChildVC:(UIViewController *)viewController;
- (void)removeChildviewController:(UIViewController *)viewController;
- (void)presentFrontViewController:(UIViewController *)frontViewController;

- (void)showHideSideView;

@end

