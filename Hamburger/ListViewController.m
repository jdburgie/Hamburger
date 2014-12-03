//
//  ListViewController.m
//  Hamburger
//
//  Created by jdburgie on 12/2/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewController delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myIdent"];

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"myIdent"];
    
    cell.textLabel.text = @"Hello!";
    
    return cell;
}

@end
