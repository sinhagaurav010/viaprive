//
//  HomeViewController.m
//  viaprive
//
//  Created by preet dhillon on 30/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    

    self.navigationItem.title = MAINTITLE;
    
//    [self.navigationController.navigationBar setTintColor:[UIColor  blackColor]];
    self.navigationController.navigationBar.barStyle    = UIBarStyleBlackTranslucent;
    self.view.backgroundColor = [UIColor  blackColor];
    
    tableViewHome.backgroundColor = [UIColor clearColor];
    tableViewHome.backgroundView = nil;
    arrayHome = [[NSMutableArray alloc] initWithObjects:CATAGORY, nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayHome count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *stringIdenifier = @"cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:stringIdenifier];
    
    if(cell == nil)
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringIdenifier] autorelease];
    
        
    [ModalController setGradientinView:cell.contentView];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.accessoryType = 1;
    
    cell.textLabel.text = [arrayHome  objectAtIndex:indexPath.row];
    cell.textLabel.textColor    = [UIColor  whiteColor];
    cell.textLabel.backgroundColor = [UIColor  clearColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"%s",__PRETTY_FUNCTION__);

    CatagoryViewController *catagoryController = [[CatagoryViewController  alloc] initWithNibName:@"CatagoryViewController" bundle:nil];
    catagoryController.stringTitle = [arrayHome objectAtIndex:indexPath.row];
    
    [self.navigationController  pushViewController:catagoryController animated:YES];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
