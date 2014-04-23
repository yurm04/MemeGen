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

- (IBAction)takePhotoPushed:(id)sender {
    if (!_cameraVC) {
        self.cameraVC = [[CameraViewController alloc]init];
    } else {
        [self.cameraVC takePhoto];
    }
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
