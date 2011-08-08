//
//  ChoosePictureViewController.m
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/8/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "ChoosePictureViewController.h"
#import "AddEmployeeViewController.h"

@implementation ChoosePictureViewController

@synthesize addEmployeeViewController, imageView, myToolbar, overlayViewController, capturedImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}






#pragma mark -
#pragma mark View Controller

- (void)viewDidLoad
{
    self.overlayViewController =
    [[[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlayViewController" bundle:nil] autorelease];
    
    // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
    self.overlayViewController.delegate = self;
    
    //self.capturedImages = [NSMutableArray array];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        // camera is not on this device, don't show the camera button
        NSMutableArray *toolbarItems = [NSMutableArray arrayWithCapacity:self.myToolbar.items.count];
        [toolbarItems addObjectsFromArray:self.myToolbar.items];
        [toolbarItems removeObjectAtIndex:2];
        [self.myToolbar setItems:toolbarItems animated:NO];
    }
}

- (void)viewDidUnload
{
    self.imageView = nil;
    self.myToolbar = nil;
    
    self.overlayViewController = nil;
    //self.capturedImage = nil;
}

- (void)dealloc
{	
	[imageView release];
	[myToolbar release];
    
    [overlayViewController release];
	[capturedImage release];
    
    [super dealloc];
}


#pragma mark -
#pragma mark Toolbar Actions

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    //if (self.imageView.isAnimating)
    //    self.imageView.stopAnimating;
	
    
    //if (self.capturedImages.count > 0)
    //    [self.capturedImages removeAllObjects];
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        [self.overlayViewController setupImagePicker:sourceType];
        [self presentModalViewController:self.overlayViewController.imagePickerController animated:YES];
    }
}

- (IBAction)photoLibraryAction:(id)sender
{   
	[self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)cameraAction:(id)sender
{
    [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
}


#pragma mark -
#pragma mark CameraOverlayViewControllerDelegate

// as a delegate we are being told a picture was taken
- (void)didTakePicture:(UIImage *)picture
{
    self.capturedImage = picture;
}

// as a delegate we are told to finished with the camera
- (void)didFinishWithCamera
{
    [self dismissModalViewControllerAnimated:YES];
    
    if (self.capturedImage != nil)
    {
        [self.imageView setImage:self.capturedImage];
        
        // TODO: This is a hack!
        [self.addEmployeeViewController.imgEmployeePhoto setImage:self.capturedImage];
    }
}



@end
