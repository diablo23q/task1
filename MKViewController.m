//
//  MKViewController.m
//  task1
//
//  Created by Администратор on 11/6/13.
//  Copyright (c) 2013 MSU. All rights reserved.
//

#import "MKViewController.h"

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
        self.tapCount = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
