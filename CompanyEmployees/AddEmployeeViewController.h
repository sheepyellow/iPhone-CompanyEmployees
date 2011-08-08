//
//  AddEmployeeViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoosePictureViewController.h"

@class EmployeeInfo;
@class ChoosePictureViewController;

@interface AddEmployeeViewController : UIViewController<UIScrollViewDelegate> {
    IBOutlet UITextField *txtEmployeeName;
	IBOutlet UITextField *txtEmployeeEmail;
   	IBOutlet UITextField *txtEmployeePhone;
   	IBOutlet UITextField *txtEmployeeDOB;
   	IBOutlet UIImageView *imgEmployeePhoto;
   	IBOutlet UITextField *txtEmployeeNotes;
    
    ChoosePictureViewController *choosePictureViewController;
    IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain) ChoosePictureViewController *choosePictureViewController;
@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) UIImageView *imgEmployeePhoto;

- (IBAction)choosePhoto:(id)sender;

@end
