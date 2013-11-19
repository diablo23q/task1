//
//  MKTableViewController.m
//  task1
//
//  Created by Администратор on 11/17/13.
//  Copyright (c) 2013 MSU. All rights reserved.
//

#import "MKTableViewController.h"
#import "MKTextViewController.h"

@interface MKTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation MKTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        self.navigationItem.rightBarButtonItem.action = @selector(switchEdit);

        self.title = @"Table";
    }
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MKCell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [self.items objectAtIndex:indexPath.item];
    cell.textLabel.numberOfLines = 0;
    return cell;
}


 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
     return YES;
}


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         [self.items removeObjectAtIndex:indexPath.item];
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     }
 }
 


 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     [self.items exchangeObjectAtIndex:fromIndexPath.item withObjectAtIndex:toIndexPath.item];
 }
 


 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
     return YES;
 }


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cSize = CGSizeMake(tableView.bounds.size.width - 50, FLT_MAX);
    CGSize size = [[self.items objectAtIndex:indexPath.item] boundingRectWithSize:cSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:14]} context:nil].size;
    return size.height*2;
}
 

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     MKTextViewController *detailViewController = [[MKTextViewController alloc] initWithString:self.items[indexPath.item] atIndex:indexPath.item];
     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

-(void)doneWithString:(NSString *)string atIndex:(NSInteger) ind
{
    if(ind == [self.items count] && ![string isEqualToString:@""]) {
        [self.items addObject:string];
    } else if(ind <  [self.items count]) {
        [self.items setObject:string atIndexedSubscript:ind];
        if([string isEqualToString:@""]) {
            [self.items removeObjectAtIndex:ind];
        }
    }
    [self.tableView reloadData];
}

- (void)switchEdit
{
    if (![self.tableView isEditing]) {
        UIActionSheet *actSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:@"Edit table"
                                                     otherButtonTitles:@"Add cell",nil];
        [actSheet showInView:self.view];
    } else {
        [super setEditing:NO animated:YES];
        [self.tableView setEditing:NO animated:YES];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [super setEditing:YES animated:YES];
        [self.tableView setEditing:YES animated:YES];
    }
    if (buttonIndex == 1) {
        MKTextViewController *detailViewController = [[MKTextViewController alloc] initWithString:@"" atIndex:[self.items count]];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.items = [[NSMutableArray alloc] initWithObjects:@"One",@"Two Two", @"Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many Many", nil];
    //self.tableView.contentMode = UIViewContentModeRight;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
