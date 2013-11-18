//
//  MKTextViewController.m
//  task1
//
//  Created by Администратор on 11/17/13.
//  Copyright (c) 2013 MSU. All rights reserved.
//

#import "MKTextViewController.h"
#import "MKTableViewController.h"

@interface MKTextViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSString* firstString;
@property (nonatomic) NSInteger indx;

@end

@implementation MKTextViewController

-(id)initWithString:(NSString *)string atIndex:(NSInteger) ind
{
    self = [super initWithNibName:@"MKTextViewController" bundle:nil];
    if (self) {
        self.firstString = string;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction:)];
        self.navigationItem.title = @"Add/Edit cell";
        self.indx = ind;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.textView setText:self.firstString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender {
    id tmpObj = self.navigationController.viewControllers[1];
    [tmpObj doneWithString:self.textView.text atIndex:self.indx];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
