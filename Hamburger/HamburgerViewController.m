//
//  HamburgerViewController.m
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "HamburgerViewController.h"
#import "ListViewController.h"

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
    [(ListViewController *)self.backViewController setDelegate:self];
    
    self.frontViewController = [storyboard instantiateViewControllerWithIdentifier:@"PictureVC"];

    [self addChildVC:self.backViewController withFrame:self.view.frame];

    [self addChildVC:self.frontViewController withFrame:self.view.frame];
}

- (void)removeChildVC: (UIViewController *)VC {
    [VC willMoveToParentViewController:nil];
    [VC.view removeFromSuperview];
    [VC removeFromParentViewController];
}


- (void)addChildVC: (UIViewController *)VC withFrame:(CGRect)frame {
    [self addChildViewController:VC];
    VC.view.frame = frame;
    [self.view addSubview:VC.view];
    [VC didMoveToParentViewController:self];
}

- (void)swapFrontChildVC:(UIViewController *)oldVC replaceWith:(UIViewController *)newVC {
    CGRect frame = oldVC.view.frame;
    [self removeChildVC:oldVC];
    self.frontViewController = newVC;
    [self addChildVC:newVC withFrame:frame];
}

- (void)hamburgerLoadPictureVC {
    UIStoryboard *storyboard = [self storyboard];
    
    [UIView animateWithDuration:0.0f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         [self swapFrontChildVC:self.frontViewController replaceWith:[storyboard instantiateViewControllerWithIdentifier:@"PictureVC"]];
                     }
                     completion:nil
     ];
}

- (void)hamburgerLoadFizzVC {
    UIStoryboard *storyboard = [self storyboard];
    
    [UIView animateWithDuration:0.0f
                          delay:0.0f
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         [self swapFrontChildVC:self.frontViewController replaceWith:[storyboard instantiateViewControllerWithIdentifier:@"FizzVC"]];
                     }
                     completion:nil
     ];
}

- (void)hamburgerShowHideSideView {
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
                     completion:nil
     ];
    
    self.isRight = !self.isRight;
}

- (IBAction)tappedHamburger:(id)sender {

    [self hamburgerShowHideSideView];
}

@end
