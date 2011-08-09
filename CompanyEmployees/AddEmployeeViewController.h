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
   	IBOutlet UITextField *txtEmployeeNotes;
    
    ChoosePictureViewController *choosePictureViewController;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIButton *addPhoto;
    
    UIImage *imgEmployeePhoto;
}

@property (nonatomic, retain) ChoosePictureViewController *choosePictureViewController;
@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) UIButton *addPhoto;
@property (nonatomic, retain) UIImage *imgEmployeePhoto;

- (IBAction)choosePhoto:(id)sender;

@end
