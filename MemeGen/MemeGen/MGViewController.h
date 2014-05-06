//
//  MGViewController.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/20/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "CameraViewController.h"
#import "CreateViewController.h"
#import "MemeCell.h"
#import "AppDelegate.h"

@import MediaPlayer;
@import MobileCoreServices;
@import AssetsLibrary;

@interface MGViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *takePhotoButton;
@property (strong, nonatomic) UIImage *pickedImage;

// DB stuff
@property (nonatomic) sqlite3 *memeGenDB;
@property (strong, nonatomic) NSString *databasePath;

// Collection View
@property (strong, nonatomic) NSMutableArray *images; // Of NSUrls

@end