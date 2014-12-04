//
//  ListViewController.h
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowHideHamburgerSideView;

@interface ListViewController : UITableViewController

@property (weak, nonatomic) id<ShowHideHamburgerSideView> delegate;

@end

@protocol ShowHideHamburgerSideView <NSObject>

- (void)loadVC: (NSString *)vcName;

@end