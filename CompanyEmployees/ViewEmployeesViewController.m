//
//  ViewEmployeesViewController.m
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "ViewEmployeesViewController.h"
#import "EmployeeDetailsViewController.h"
#import "EmployeeInfo.h"

@implementation ViewEmployeesViewController

@synthesize employeeDetailsViewController;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	//self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] 
	//										 initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
	//										 target:self action:@selector(add_Clicked:)];
    
    
	
	appDelegate = (CompanyEmployeesAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	self.title = @"Employees";
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}








- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appDelegate.employeeArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
	//Get the object from the array.
	EmployeeInfo *employeeObj = [appDelegate.employeeArray objectAtIndex:indexPath.row];
	
	//Set the employeeName.
	cell.text = employeeObj.employeeName;
    
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic -- create and push a new view controller
    
    CompanyEmployeesAppDelegate *appDelegate = (CompanyEmployeesAppDelegate *)[[UIApplication sharedApplication] delegate];
	EmployeeInfo *employee = (EmployeeInfo *)[appDelegate.employeeArray objectAtIndex:indexPath.row];
	
	if(self.employeeDetailsViewController == nil) {
		EmployeeDetailsViewController *viewController = [[EmployeeDetailsViewController alloc] initWithNibName:@"EmployeeDetailsViewController" bundle:nil];
		self.employeeDetailsViewController = viewController;
		[viewController release];
	}
	
	// Setup the animation
	[self.navigationController pushViewController:self.employeeDetailsViewController animated:YES];
	// Set the title of the view to the animal's name
    self.employeeDetailsViewController.title = [employee employeeName];
    
	[self.employeeDetailsViewController.employeeName setText:[employee employeeName]];
	// Set the description field to the animals description
	[self.employeeDetailsViewController.employeeEmail setText:[employee employeeEmail]];
    [self.employeeDetailsViewController.employeePhone setText:[employee employeePhone]];
    [self.employeeDetailsViewController.employeeDOB setText:[employee employeeDOB]];
    [self.employeeDetailsViewController.employeeNotes setText:[employee employeeNotes]];
    
	// Load the animals image into a NSData boject and then assign it to the UIImageView
	//NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[animal imageURL]]];
	//UIImage *animalImage = [[UIImage alloc] initWithData:imageData cache:YES];
	//self.animalView.animalImage.image = animalImage;
}






- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(editingStyle == UITableViewCellEditingStyleDelete) {
		
		//Get the object to delete from the array.
		EmployeeInfo *employeeObj = [appDelegate.employeeArray objectAtIndex:indexPath.row];
		[appDelegate removeEmployee:employeeObj];
		
		//Delete the object from the table.
		[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}


/*
 // Override to support conditional editing of the list
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
*/


/*
 // Override to support rearranging the list
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the list
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self.tableView reloadData];
}
/*
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	
	[super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
	
	//Do not let the user add if the app is in edit mode.
	if(editing)
		self.navigationItem.leftBarButtonItem.enabled = NO;
	else
		self.navigationItem.leftBarButtonItem.enabled = YES;
}
 */

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 }
 */

- (void)dealloc {
	[appDelegate release];
	//[avController release];
    [super dealloc];
}



@end
