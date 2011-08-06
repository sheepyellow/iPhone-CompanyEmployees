//
//  AddEmployeeViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmployeeInfo;

@interface AddEmployeeViewController : UIViewController {
    IBOutlet UITextField *txtEmployeeName;
	IBOutlet UITextField *txtEmployeeEmail;
   	IBOutlet UITextField *txtEmployeePhone;
   	IBOutlet UITextField *txtEmployeeDOB;
   	IBOutlet UITextField *txtEmployeePhoto;
   	IBOutlet UITextField *txtEmployeeNotes;
}

@end
