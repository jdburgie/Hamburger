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

- (void)presentFrontViewController:(UIViewController *)frontViewController;

@end

