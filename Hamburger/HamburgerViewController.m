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
    self.sideViewWidthPercent = 0.5f;

    self.vanityViewController = [[UIViewController alloc] init];
    CGRect vanityFrame = self.view.frame;
    NSInteger vanityWidth = self.view.frame.size.width * 0.05f;
    vanityFrame.size.width = vanityWidth;
    vanityFrame.origin.x = self.view.frame.size.width;
    self.vanityFrameOutView = vanityFrame;
    vanityFrame.origin.x = self.view.frame.size.width - vanityWidth + 1.0f;
    self.vanityFrameInView = vanityFrame;
    
    self.backViewController.view.frame = self.view.frame;
    self.vanityViewController.view.frame = self.vanityFrameInView;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    CGRect vanityFrame = self.vanityViewController.view.frame;
    NSInteger vanityWidth = self.view.frame.size.width * 0.05f;
    vanityFrame.size.width = vanityWidth;
    vanityFrame.origin.x = self.view.frame.size.width;
    self.vanityFrameOutView = vanityFrame;
    vanityFrame.origin.x = self.view.frame.size.width - vanityWidth + 1.0f;
    self.vanityFrameInView = vanityFrame;
}

# pragma mark - Private methods

- (void)addChildVC:(UIViewController *)viewController {
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)removeChildviewController:(UIViewController *)viewController {
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}

- (void)swapFrontChildviewController:(UIViewController *)oldViewController replaceWith:(UIViewController *)newViewController {
    CGRect frame = self.frontViewController.view.frame;
    [self removeChildviewController:oldViewController];
    self.frontViewController = newViewController;
    self.frontViewController.view.frame = frame;
    [self.vanityViewController.view setBackgroundColor:self.frontViewController.view.backgroundColor];
    [self addChildVC:self.frontViewController];
}

- (void)presentFrontViewController:(UIViewController *)frontViewController {
    self.vanityViewController.view.frame = self.vanityFrameOutView;
    
    [UIView animateWithDuration:0.25f
                     animations:^{
                         CGRect frame = self.frontViewController.view.frame;
                         
                         // Move frontViewController view off the screen to the right
                         frame.origin.x = self.view.frame.size.width;
                         self.frontViewController.view.frame = frame;
                     }
                     completion:^(BOOL finished){
                         [self swapFrontChildviewController:self.frontViewController replaceWith:frontViewController];
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
                         self.vanityViewController.view.frame = self.vanityFrameInView;
                         
                         CGRect frame = self.view.frame;
                         
                         if (self.isRight) {
                             frame.origin.x = 0.0f;
                         } else {
                             frame.origin.x = frame.size.width * self.sideViewWidthPercent;
                         }
                         
                         self.frontViewController.view.frame = frame;
                     }
                     completion:^(BOOL finished){ }
     ];
    
    self.isRight = !self.isRight;
}

- (IBAction)tappedHamburger:(id)sender {
    [self showHideSideView];
}

@end
