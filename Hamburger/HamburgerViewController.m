//
//  HamburgerViewController.m
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "HamburgerViewController.h"
#import "PictureViewController.h"
#import "ListViewController.h"

@interface HamburgerViewController ()

@property (strong, nonatomic) IBOutlet ListViewController *backViewController;
@property (strong, nonatomic) IBOutlet PictureViewController *frontViewController;

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)tappedHamburger:(id)sender {
    CGRect f = self.view.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelay:0.1f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.isRight) {
        f.origin.x = 0.0f;
    } else {
        f.origin.x = 300.0f;
    }
    self.frontViewController.view.frame = f;

    [UIView commitAnimations];
    
    self.isRight = !self.isRight;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
