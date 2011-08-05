//
//  RootViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEmployeeViewController.h"
#import "ViewEmployeesViewController.h"
#import "CompanyEmployeesAppDelegate.h"

@class EmployeeInfo;

@interface RootViewController : UIViewController {
    //CompanyEmployeesAppDelegate *appDelegate;
    AddEmployeeViewController *addEmployeeViewController;
    ViewEmployeesViewController *viewEmployeeViewController;
    //UINavigationController *addNavigationController;
}

@property (nonatomic, retain) AddEmployeeViewController *addEmployeeViewController;

@property (nonatomic, retain) ViewEmployeesViewController *viewEmployeeViewController;

- (IBAction)switchPageAddEmployee:(id)sender;
- (IBAction)switchPageViewEmployees:(id)sender;

@end
