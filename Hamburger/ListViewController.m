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
@property (strong, nonatomic) NSArray *vcNames;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rowLabels = @[@"Pictures", @"Fizz Buzz"];
    self.vcNames = @[@"PictureVC", @"FizzVC"];
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

- (void)listLoadVC: (NSString *)vcName {
    if ([self.delegate respondsToSelector:@selector(loadVC:)]) {
        [self.delegate loadVC:vcName];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    [self listLoadVC:self.vcNames[row]];
}

@end
