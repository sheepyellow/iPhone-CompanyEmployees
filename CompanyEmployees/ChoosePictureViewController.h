//
//  ChoosePictureViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/8/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CameraOverlayViewController.h"
#import "AddEmployeeViewController.h"

@class AddEmployeeViewController;

@interface ChoosePictureViewController : UIViewController <UIImagePickerControllerDelegate,
CameraOverlayViewControllerDelegate>
{
    AddEmployeeViewController *addEmployeeViewController; // TODO: Fix this hack
    
    UIImageView *imageView;
    UIToolbar *myToolbar;
    
    CameraOverlayViewController *overlayViewController; // the camera custom overlay view
    
    UIImage *capturedImage; // the list of images captures from the camera (either 1 or multiple)
}

@property (nonatomic, retain) AddEmployeeViewController *addEmployeeViewController;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIToolbar *myToolbar;

@property (nonatomic, retain) CameraOverlayViewController *overlayViewController;

@property (nonatomic, retain) UIImage *capturedImage;

- (IBAction)photoLibraryAction:(id)sender;
- (IBAction)cameraAction:(id)sender;

@end
