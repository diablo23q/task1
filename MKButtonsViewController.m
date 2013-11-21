//
//  MKButtonsViewController.m
//  task1
//
//  Created by Администратор on 11/19/13.
//  Copyright (c) 2013 MSU. All rights reserved.
//

#import "MKButtonsViewController.h"

@interface MKButtonsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pbutton1;
@property (weak, nonatomic) IBOutlet UIButton *pbutton2;
@property (weak, nonatomic) IBOutlet UIButton *pbutton3;
@property (weak, nonatomic) IBOutlet UIButton *pbutton4;
@property (weak, nonatomic) IBOutlet UIButton *pbutton5;
@property (weak, nonatomic) IBOutlet UIButton *pbutton6;
@property (weak, nonatomic) IBOutlet UIButton *pbutton7;
@property (weak, nonatomic) IBOutlet UIButton *pbutton9;
@property (strong, nonatomic) UIButton *pbutton10;
@property (strong, nonatomic) UIButton *pbutton11;
@property (nonatomic) BOOL showing6;
@property (nonatomic) BOOL showing7;
@end

@implementation MKButtonsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.showing6 = YES;
        self.showing7 = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.pbutton10 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.pbutton11 = [self.pbutton11 init];
    self.pbutton11 = self.pbutton4;
    self.pbutton10 = self.pbutton3;
    self.pbutton10.center = self.pbutton6.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1:(UIButton *)sender {
    [UIView animateWithDuration:1.0 animations:^{sender.alpha = 0.0;} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{sender.alpha = 1.0;}];}];
}

- (IBAction)button2:(UIButton *)sender {
    [UIView animateWithDuration:1.0 animations:^{sender.transform = CGAffineTransformScale(sender.transform, 0.5, 0.5);} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{sender.transform = CGAffineTransformScale(sender.transform, 2.0, 2.0);}];}];
}

- (IBAction)button3:(UIButton *)sender {
    CGPoint tcenter = sender.center;
    [UIView animateWithDuration:1.0 animations:^{sender.center = self.pbutton4.center;} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{sender.center = tcenter;}];}];
}

- (IBAction)button4:(UIButton *)sender {
    CGPoint tcenter = sender.center;
    [UIView animateWithDuration:1.0 animations:^{sender.center = self.pbutton3.center;} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{sender.center = tcenter;}];}];
}

- (IBAction)button5:(UIButton *)sender {
    [UIView animateWithDuration:1.0 animations:^{sender.transform = CGAffineTransformRotate(sender.transform, M_PI/4);} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{sender.transform = CGAffineTransformRotate(sender.transform, -M_PI/4);}];}];
}

- (IBAction)button6:(UIButton *)sender {
    [UIView transitionFromView:(self.showing6 ? self.pbutton6 : self.pbutton4) toView:(self.showing6 ? self.pbutton4 : self.pbutton6) duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished){if(finished) self.showing6 = !self.showing6;}];
}

- (IBAction)button7:(UIButton *)sender {
    
}

- (IBAction)button8:(UIButton *)sender {
    [self button1:self.pbutton1];
    [self button2:self.pbutton2];
    
    CGPoint tcenter3 = self.pbutton3.center;
    CGPoint tcenter4 = self.pbutton4.center;
    
    [UIView animateWithDuration:1.0 animations:^{self.pbutton3.center = tcenter4;} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{self.pbutton3.center = tcenter3;}];}];
    
    [UIView animateWithDuration:1.0 animations:^{self.pbutton4.center = tcenter3;} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{self.pbutton4.center = tcenter4;}];}];
    
    [self button5:self.pbutton5];
    [self button9:self.pbutton9];
}

- (IBAction)button9:(UIButton *)sender {
    UIColor *tcolor = sender.backgroundColor;
    [UIView animateWithDuration:1.0 animations:^{sender.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.2 alpha:1.0];} completion:^(BOOL finished){[UIView animateWithDuration:1.0 animations:^{sender.backgroundColor = tcolor;}];}];
}



@end
