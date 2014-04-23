//
//  ViewController.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/15/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "CreateViewController.h"

@import AssetsLibrary;
#import "MemeImageView.h"


@interface CreateViewController ()



@end

@implementation CreateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    // image to be used
    UIImage *image = [UIImage imageNamed:@"camera.png"];
    CGRect frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    SPUserResizableView *userResizableView = [[SPUserResizableView alloc] initWithFrame:frame];
    // Creating image view to set as content
    MemeImageView *meme = [[MemeImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) image:image];
    userResizableView.contentView = meme;
    [self.view addSubview:userResizableView];
    userResizableView.center = self.view.center;
    //SPUserResizeableView
    */
    
    // adding meme image as subview
    //UIImage *image = [UIImage imageNamed:@"camera.png"];
    // Using passedImage 
    self.memeView = [[MemeImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.passedImage.size.width, self.passedImage.size.height) image:self.passedImage];
    [self.view addSubview:self.memeView];
    self.memeView.center = self.view.center;
}
- (IBAction)saveMeme:(id)sender {
    [self savePhotoOfView:self.memeView];
}

- (void)savePhotoOfView:(UIView *)imageView
{
    UIGraphicsBeginImageContext(imageView.bounds.size);
    
    
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(viewImage,
                                   self,
                                   @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:),
                                   NULL);

    /*
    [imageView drawRect:imageView.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image,
                                   self,
                                   @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:),
                                   NULL);
     */
}

- (void)   savedPhotoImage:(UIImage *)image
  didFinishSavingWithError:(NSError *)error
               contextInfo:(void *)contextInfo
{
    NSString *message = @"This image has been saved to your Photos album";
    if (error) {
        message = [error localizedDescription];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
