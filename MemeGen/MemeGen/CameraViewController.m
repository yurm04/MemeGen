//
//  CameraViewController.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/17/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "CameraViewController.h"

@import MediaPlayer;
@import MobileCoreServices;
@import AssetsLibrary;

@interface CameraViewController ()

@end

@implementation CameraViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImage* img = [UIImage imageNamed:@"camera.png"];
        UIImageView* imgView = [[UIImageView alloc]initWithImage: img];
        
        [self.view addSubview: imgView];
        imgView.center = CGPointMake(self.view.frame.size.width/2, imgView.frame.size.height/2);
        // future:  make it load a background image in the view showing there is no camera available.
    }
}

- (BOOL) startCameraControllerFromViewController: (UIViewController *) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,UINavigationControllerDelegate>) delegate
{
    UIImagePickerController *camera = [[UIImagePickerController alloc] init];
    camera.delegate = self;
    
    // camera source type instead of media browser
    camera.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
    
    camera.mediaTypes = @[@"kUTTypeMovie"];
    
    camera.allowsEditing = YES;
    
    camera.delegate = delegate;
    
    [self presentViewController:camera animated:YES completion:NULL];
    
    return YES;
    
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
