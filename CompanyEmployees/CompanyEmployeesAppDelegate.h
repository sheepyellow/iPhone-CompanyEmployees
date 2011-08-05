//
//  CompanyEmployeesAppDelegate.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmployeeInfo;

@interface CompanyEmployeesAppDelegate : NSObject <UIApplicationDelegate> {
    UINavigationController *navigationController;
    
    //To hold a list of EmployeeInfo objects
	NSMutableArray *employeeArray;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) NSMutableArray *employeeArray;

- (void) copyDatabaseIfNeeded;
- (NSString *) getDBPath;

- (void) removeEmployee:(EmployeeInfo *)employeeObj;
- (void) addEmployee:(EmployeeInfo *)employeeObj;

@end
