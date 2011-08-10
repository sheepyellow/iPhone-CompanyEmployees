//
//  EmployeeDetailsViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"

@interface EmployeeDetailsViewController : UIViewController {
    IBOutlet UILabel *employeeName;
	IBOutlet UILabel *employeeEmail;
    IBOutlet UILabel *employeePhone;
    IBOutlet UILabel *employeeDOB;
    UIImage *employeePhoto;
    IBOutlet UILabel *employeeNotes;
    
    IBOutlet UIButton *employeePhotoButton;
    
    PhotoViewController *photoViewController;
    
}

@property (nonatomic, retain) IBOutlet UILabel *employeeName;
@property (nonatomic, retain) IBOutlet UILabel *employeeEmail;
@property (nonatomic, retain) IBOutlet UILabel *employeePhone;
@property (nonatomic, retain) IBOutlet UILabel *employeeDOB;
@property (nonatomic, retain) UIButton *employeePhotoButton;
@property (nonatomic, retain) IBOutlet UILabel *employeeNotes;
@property (nonatomic, retain) UIImage *employeePhoto;
- (IBAction)photoButtonPressed:(id)sender;

@property (nonatomic, retain) PhotoViewController *photoViewController;

@end
