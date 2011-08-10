//
//  ViewEmployeesViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyEmployeesAppDelegate.h"
#import "EmployeeDetailsViewController.h"

@interface ViewEmployeesViewController : UITableViewController {
    CompanyEmployeesAppDelegate *appDelegate;
    
    EmployeeDetailsViewController *employeeDetailsViewController;
}

@property (nonatomic, retain) EmployeeDetailsViewController *employeeDetailsViewController;


@end
