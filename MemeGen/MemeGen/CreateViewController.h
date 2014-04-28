//
//  ViewController.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/15/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeImageView.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@interface CreateViewController : UIViewController

@property (strong, nonatomic) UIImage *passedImage;
//@property (strong, nonatomic) MemeImageView *memeView;
@property (strong, nonatomic) IBOutlet UIImageView *memeView;

- (void)savePhotoOfView:(UIImageView *)imageView;
- (void)   savedPhotoImage:(UIImage *)image
  didFinishSavingWithError:(NSError *)error
               contextInfo:(void *)contextInfo;

@end