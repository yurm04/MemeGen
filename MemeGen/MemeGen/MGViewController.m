//
//  MGViewController.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/20/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MGViewController.h"



@interface MGViewController ()

//- (ALAssetsLibrary *) assetsLibrary;

@end

@implementation MGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // If there is no camera, button is disabled
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self.takePhotoButton setEnabled:NO];
    }
    
    // Using the Assets Library to populate collection view
}

#pragma mark Camera Controls
////////////////////
// CAMERA CONTROL //
////////////////////

- (IBAction)takePhoto:(id)sender {
    
    // Instantiating and presenting camera interface
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // Setting the CameraAppVC as the picker delegate
    picker.delegate = self;
    
    // camera interface and user interaction handled by the system
    
    /*
     Have to set media types.  Set mediaTypes property to an array containing still image type
     first call availableMediaTypesForSourceType: class method to find out which media types are available
     do an if statment to save the still image type to an array
     call the mediaTypes method with the array with only still images
     or apparently the default value is image only?
     [picker mediaTypes:@[@"kUTTypeImage"]];
     For stills only
     */
    
    
    // picker allows editing
    picker.allowsEditing = YES;
    
    // setting the source type as the camera rather than the media browser
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
