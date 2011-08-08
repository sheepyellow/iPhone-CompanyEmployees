//
//  CameraOverlayViewController.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/8/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CameraOverlayViewControllerDelegate;

@interface CameraOverlayViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    id <CameraOverlayViewControllerDelegate> delegate;
    
    UIImagePickerController *imagePickerController;
    
@private
    UIBarButtonItem *takePictureButton;
    UIBarButtonItem *cancelButton;
}    

@property (nonatomic, assign) id <CameraOverlayViewControllerDelegate> delegate;
@property (nonatomic, retain) UIImagePickerController *imagePickerController;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *takePictureButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;


- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType;

// camera page (overlay view)
- (IBAction)done:(id)sender;
- (IBAction)takePhoto:(id)sender;

@end

@protocol CameraOverlayViewControllerDelegate
- (void)didTakePicture:(UIImage *)picture;
- (void)didFinishWithCamera;
@end