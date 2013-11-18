//
//  MKTableViewController.h
//  task1
//
//  Created by Администратор on 11/17/13.
//  Copyright (c) 2013 MSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
-(void)doneWithString:(NSString *)string atIndex:(NSInteger) ind;

@end
