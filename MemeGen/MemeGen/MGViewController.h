//
//  MGViewController.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/20/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraViewController.h"
#import "CreateViewController.h"

@import MediaPlayer;
@import MobileCoreServices;
@import AssetsLibrary;

@interface MGViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UIBarButtonItem *takePhotoButton;

@property (strong, nonatomic) UIImage *pickedImage;



@end