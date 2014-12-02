//
//  ViewController.m
//  asdfasdf
//
//  Created by jdburgie on 12/1/14.
//  Copyright (c) 2014 ThreeOakWood. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIViewController *view0;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *hamburger;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (assign, nonatomic) int pos;
@property (assign, nonatomic) BOOL hasChild;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pos = 0;
    self.hasChild = NO;

    self.view0 = [[UIViewController alloc] init];
    [self.view0.view setBackgroundColor:[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedAddChild:(id)sender {
    [self displayNewSubview:self.view0];
}

- (IBAction)tappedRemoveChild:(id)sender {
    [self hideContentController:self.view0];
}

- (IBAction)tappedHamburger:(id)sender {
    CGRect f = self.view.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelay:0.1f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.pos == 0) {
        f.origin.x = 300.0f;
        self.view0.view.frame = f;
        
        f.origin.x = 0.0f;
        self.view1.frame = f;
    } else if (self.pos == 1){
        f.origin.x = 300.0f;
        self.view0.view.frame = f;
        self.view1.frame = f;
    } else {
        f.origin.x = 0.0f;
        self.view0.view.frame = f;
        self.view1.frame = f;
    }

    [UIView commitAnimations];

    self.pos = (self.pos + 1)%3;
}

- (void)displayNewSubview: (UIViewController *)vc {
    [self addChildViewController:vc];
    
    vc.view.frame = self.view.frame;
    
    [self.view addSubview:vc.view];
    
    [vc didMoveToParentViewController:self];
    
    self.hasChild = YES;
}

- (void)hideContentController: (UIViewController *) vc {
    [vc willMoveToParentViewController:nil];
    
    [vc.view removeFromSuperview];
    
    [vc removeFromParentViewController];
    
    self.hasChild = NO;
}

#pragma mark - UITableViewController delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"myIdent"];
    
    if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myIdent"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld text label", (long)indexPath.row];
    
    return cell;
}

@end
