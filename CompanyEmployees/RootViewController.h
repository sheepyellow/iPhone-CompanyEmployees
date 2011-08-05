//
//  RootViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEmployeeViewController.h"

@interface RootViewController : UIViewController {
    AddEmployeeViewController *addEmployeeViewController;
}

@property (nonatomic, retain) AddEmployeeViewController *addEmployeeViewController;

- (IBAction)switchPageAddEmployee:(id)sender;

@end
