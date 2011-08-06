//
//  EmployeeDetailsViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeDetailsViewController : UIViewController {
    IBOutlet UILabel *employeeName;
	IBOutlet UILabel *employeeEmail;
    IBOutlet UILabel *employeePhone;
    IBOutlet UILabel *employeeDOB;
    IBOutlet UILabel *employeePhoto;
    IBOutlet UILabel *employeeNotes;
    
}

@property (nonatomic, retain) IBOutlet UILabel *employeeName;
@property (nonatomic, retain) IBOutlet UILabel *employeeEmail;
@property (nonatomic, retain) IBOutlet UILabel *employeePhone;
@property (nonatomic, retain) IBOutlet UILabel *employeeDOB;
@property (nonatomic, retain) IBOutlet UILabel *employeePhoto;
@property (nonatomic, retain) IBOutlet UILabel *employeeNotes;


@end
