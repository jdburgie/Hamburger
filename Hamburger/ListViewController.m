//
//  ListViewController.m
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@property (strong, nonatomic) NSArray *rowLabels;
@property (strong, nonatomic) NSArray *viewControllerNames;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hamburgerViewController = (HamburgerViewController *)self.parentViewController;

    self.rowLabels = @[@"Pictures", @"Bizz Buzz"];
    self.viewControllerNames = @[@"PictureViewController", @"FizzViewController"];
}

#pragma mark - UITableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rowLabels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myIdent"];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"myIdent"];
    
    cell.textLabel.text = self.rowLabels[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    UIStoryboard *storyboard = [self storyboard];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:self.viewControllerNames[row]];
    
    if ([self.hamburgerViewController.frontViewController class] == [viewController class]) {
        [self.hamburgerViewController showHideSideView];
    } else {
        [self.hamburgerViewController presentFrontViewController:viewController];
    }
}

@end
