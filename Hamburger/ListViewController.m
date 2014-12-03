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

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rowLabels = @[@"Pictures", @"Fizz Buzz", @"reserved 3", @"reserved 4", @"reserved 5"];
}

#pragma mark - UITableViewController delegate methods

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

- (void)listShowHideSideView {
    if ([self.delegate respondsToSelector:@selector(hamburgerShowHideSideView)]) {
        [self.delegate hamburgerShowHideSideView];
    }
}

- (void)listLoadPictureVC {
    if ([self.delegate respondsToSelector:@selector(hamburgerLoadPictureVC)]) {
        [self.delegate hamburgerLoadPictureVC];
    }
}

- (void)listLoadFizzVC {
    if ([self.delegate respondsToSelector:@selector(hamburgerLoadFizzVC)]) {
        [self.delegate hamburgerLoadFizzVC];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    if ([self.rowLabels[row] isEqualToString:@"Pictures"]) {
        [self listLoadPictureVC];
    }
    
    if ([self.rowLabels[row] isEqualToString:@"Fizz Buzz"]) {
        [self listLoadFizzVC];
    }

    [self listShowHideSideView];
}

@end
