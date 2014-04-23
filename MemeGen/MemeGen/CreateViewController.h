//
//  ViewController.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/15/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeImageView.h"

@interface CreateViewController : UIViewController

@property (strong, nonatomic) UIImage *passedImage;

@property (strong, nonatomic) IBOutlet MemeImageView *memeView;



@end
