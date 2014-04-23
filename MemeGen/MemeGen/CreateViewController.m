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
    UIImage *image = [UIImage imageNamed:@"camera.png"];
    MemeImageView *meme = [[MemeImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, image.size.width, image.size.height) image:image];
    [self.view addSubview:meme];
    meme.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
