//
//  EmployeeDetailsViewController.m
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "EmployeeDetailsViewController.h"

@implementation EmployeeDetailsViewController

@synthesize employeeName, employeeEmail, employeePhone, employeeDOB, employeePhotoButton, employeeNotes, photoViewController, employeePhoto;

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

- (IBAction)photoButtonPressed:(id)sender {
    
    if(self.photoViewController == nil) {
        PhotoViewController *viewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
        self.photoViewController = viewController;
        [viewController release];
    }
    
    [self.navigationController pushViewController:self.photoViewController animated:YES];
    
    self.photoViewController.imageView.image = self.employeePhoto;
}

- (void) dealloc {
    [photoViewController release];
    
    [super dealloc];
}
@end
