//
//  EmployeeDetails.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeDetailsViewController : UIViewController {
    IBOutlet UILabel *employeeName;
    
	IBOutlet UILabel *employeeEmail;
}

@property (nonatomic, retain) IBOutlet UILabel *employeeName;
@property (nonatomic, retain) IBOutlet UILabel *employeeEmail;

@end
