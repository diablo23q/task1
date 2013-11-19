//
//  MKViewController.m
//  task1
//
//  Created by Администратор on 11/6/13.
//  Copyright (c) 2013 MSU. All rights reserved.
//

#import "MKViewController.h"
#import "MKTableViewController.h"

@interface MKViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tapCountLabel;
@property (nonatomic) int tapCount;
@end

@implementation MKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Main screen";
        self.tapCount = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incTapCount:(id)sender {
    self.tapCount++;
    self.tapCountLabel.text = [NSString stringWithFormat:@"Tap count: %d", self.tapCount];
}

- (IBAction)gotoTable:(id)sender {
    UIViewController *sec=[[MKTableViewController alloc] initWithNibName:@"MKTableViewController" bundle:nil];
    [self.navigationController pushViewController:sec animated:YES];
}

@end
