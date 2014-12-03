//
//  HamburgerViewController.m
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "HamburgerViewController.h"

@interface HamburgerViewController ()

@property (strong, nonatomic) UIViewController *backViewController;
@property (strong, nonatomic) UIViewController *frontViewController;

@property (assign, nonatomic) BOOL isRight;

@end

@implementation HamburgerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isRight = NO;
    UIStoryboard *storyboard = [self storyboard];
    
    self.backViewController = [storyboard instantiateViewControllerWithIdentifier:@"ListVC"];
    self.frontViewController = [storyboard instantiateViewControllerWithIdentifier:@"PictureVC"];

    [self addChildViewController:self.backViewController];
    self.backViewController.view.frame = self.view.frame;
    [self.view addSubview:self.backViewController.view];
    [self.backViewController didMoveToParentViewController:self];
    
    [self addChildViewController:self.frontViewController];
    self.frontViewController.view.frame = self.view.frame;
    [self.view addSubview:self.frontViewController.view];
    [self.frontViewController didMoveToParentViewController:self];
}

- (IBAction)tappedHamburger:(id)sender {

    [UIView animateWithDuration:1.0f
                          delay:0.01f
         usingSpringWithDamping:0.6f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect frame = self.view.frame;
                         
                         if (self.isRight) {
                             frame.origin.x = 0.0f;
                         } else {
                             frame.origin.x = frame.size.width * 0.9f;
                         }
                         self.frontViewController.view.frame = frame;
                     }
                     completion:^(BOOL finished) { }];

    self.isRight = !self.isRight;
}

@end
