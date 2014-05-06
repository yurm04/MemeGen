//
//  ViewController.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/15/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "CreateViewController.h"

#import "MemeImageView.h"
#import "AppDelegate.h"

@interface CreateViewController ()

@end

@implementation CreateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.memeView.image = self.passedImage;
    [self.memeView prepareImage];
    self.memeView.contentMode = UIViewContentModeScaleAspectFit;

    // check if this works for center
    [self.view addSubview:self.memeView];
    [self.memeView setCenter:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))];
    
}
- (IBAction)saveMeme:(id)sender {
    [self savePhotoOfView:self.memeView];
}

- (void)savePhotoOfView:(UIView *)imageView
{
    //UIGraphicsBeginImageContext(imageView.bounds.size);
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
    [library writeImageToSavedPhotosAlbum:viewImage.CGImage orientation:(ALAssetOrientation)viewImage.imageOrientation completionBlock:^(NSURL* assetURL, NSError* error) {
       
        AppDelegate *appDelegate = [[AppDelegate alloc]init];
        [appDelegate insertImageURL:assetURL];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Saved Image"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
        
        
    }];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    // Dismiss to go back to the root view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end