//
//  AddEmployeeViewController.m
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "EmployeeInfo.h"
#import "CompanyEmployeesAppDelegate.h"

@implementation AddEmployeeViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Add Employee";
    
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
											  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                              target:self action:@selector(cancel_Clicked:)] autorelease];
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
											   target:self action:@selector(save_Clicked:)] autorelease];
	
	//self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // Setup scroll view
    //[scrollView setContentSize:CGSizeMake(backgroundImage.frame.size.width, backgroundImage.frame.size.height+200)];
}


- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	//Set the textboxes to empty string.
	txtEmployeeEmail.text = @"";
	txtEmployeeName.text = @"";
    txtEmployeePhone.text = @"";
    txtEmployeeDOB.text = @"";
    txtEmployeeNotes.text = @"";
	
	//Make the coffe name textfield to be the first responder.
	[txtEmployeeName becomeFirstResponder];
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

- (void) save_Clicked:(id)sender {
	
	CompanyEmployeesAppDelegate *appDelegate = (CompanyEmployeesAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	//Create a EmployeeInfo Object.
	EmployeeInfo *employeeObj = [[EmployeeInfo alloc] initWithPrimaryKey:0];
	employeeObj.employeeName = txtEmployeeName.text;
	employeeObj.employeeEmail = txtEmployeeEmail.text;
    employeeObj.employeePhone = txtEmployeePhone.text;
    employeeObj.employeeDOB = txtEmployeeDOB.text;
    //employeeObj.employeePhoto
    employeeObj.employeeNotes = txtEmployeeNotes.text;
	employeeObj.isDirty = NO;
	employeeObj.isDetailViewHydrated = YES;
	
	//Add the object
	[appDelegate addEmployee:employeeObj];
	
	//Dismiss the controller.
	//[self.navigationController dismissModalViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) cancel_Clicked:(id)sender {
	
	//Dismiss the controller.
	//[self.navigationController dismissModalViewControllerAnimated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	
	[theTextField resignFirstResponder];
	return YES;
}


@end
