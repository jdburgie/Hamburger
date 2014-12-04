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

@property (assign, nonatomic) BOOL isRight;

@end

@implementation HamburgerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isRight = NO;
    
    UIStoryboard *storyboard = [self storyboard];
    
    self.backViewController = [storyboard instantiateViewControllerWithIdentifier:@"ListVC"];
    self.frontViewController = [storyboard instantiateViewControllerWithIdentifier:@"PictureVC"];
    
    [self addChildVC:self.backViewController withFrame:self.view.frame];
    [self addChildVC:self.frontViewController withFrame:self.view.frame];
}

- (void)removeChildVC:(UIViewController *)VC {
    [VC willMoveToParentViewController:nil];
    [VC.view removeFromSuperview];
    [VC removeFromParentViewController];
}


- (void)addChildVC:(UIViewController *)viewController withFrame:(CGRect)frame {
    [self addChildViewController:viewController];
    viewController.view.frame = frame;
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)swapFrontChildVC:(UIViewController *)oldViewController replaceWith:(UIViewController *)newViewController {
    CGRect frame = oldViewController.view.frame;
    [self removeChildVC:oldViewController];
    self.frontViewController = newViewController;
    [self addChildVC:newViewController withFrame:frame];
}

- (void)presentFrontViewController:(UIViewController *)frontViewController {
    [UIView animateWithDuration:0.25f
                     animations:^{
                         CGRect frame = self.frontViewController.view.frame;
                         
                         // Move frontViewController view off the screen to the right
                         frame.origin.x = self.view.frame.size.width;
                         self.frontViewController.view.frame = frame;
                     }
                     completion:^(BOOL finished){
                         [self swapFrontChildVC:self.frontViewController replaceWith:frontViewController];
                         [self showHideSideView];
                     }
     ];
    
}

- (void)showHideSideView {
    [UIView animateWithDuration:0.75f
                          delay:0.01f
         usingSpringWithDamping:0.75f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect frame = self.view.frame;
                         
                         if (self.isRight)
                             {
                             frame.origin.x = 0.0f;
                         } else
                             {
                             frame.origin.x = frame.size.width * 0.9f;
                         }
                         self.frontViewController.view.frame = frame;
                     }
                     completion:nil
     ];
    
    self.isRight = !self.isRight;
}

- (IBAction)tappedHamburger:(id)sender {
    [self showHideSideView];
}

@end
