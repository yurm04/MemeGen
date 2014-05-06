//
//  MGViewController.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/20/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MGViewController.h"
#import <objc/runtime.h> // for objc_setAssociatedObject / objc_getAssociatedObject

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
    
    // Reload the collection view
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.collectionView reloadData];
}

// Images getter
- (NSMutableArray *) images
{
    
        AppDelegate *appDelegate = [[AppDelegate alloc]init];
        _images = [[NSMutableArray alloc]initWithArray:[appDelegate populateImages]];
    
    return _images;
}

/////////////////////
// COLLECTION VIEW //
/////////////////////
#pragma mark - Collection View
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
    
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MemeCell *cell = (MemeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MemeCell" forIndexPath:indexPath];
    
    [cell setMeme:self.images[indexPath.row]];
    
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView* cellImageView = cell.contentView.subviews.lastObject;
    
    UIImageView* expandedImageView = [[UIImageView alloc] initWithImage: cellImageView.image];
    expandedImageView.contentMode = cellImageView.contentMode;
    expandedImageView.frame = [self.view convertRect: cellImageView.frame fromView: cellImageView.superview];
    expandedImageView.userInteractionEnabled = YES;
    expandedImageView.clipsToBounds = YES;
    
    objc_setAssociatedObject( expandedImageView,
                             "original_frame",
                             [NSValue valueWithCGRect: expandedImageView.frame],
                             OBJC_ASSOCIATION_RETAIN);
    
    [UIView transitionWithView: self.view
                      duration: 0.3
                       options: UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
                        
                        [self.view.window addSubview: expandedImageView];
                        expandedImageView.frame = self.view.bounds;
                        
                    } completion:^(BOOL finished) {
                        
                        UITapGestureRecognizer* tgr = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector( onTap: )];
                        [expandedImageView addGestureRecognizer: tgr];
                    }];
}

- (void) onTap: (UITapGestureRecognizer*) tgr
{
    [UIView animateWithDuration: 0.3
                     animations:^{
                         
                         tgr.view.frame = [objc_getAssociatedObject( tgr.view,
                                                                    "original_frame" ) CGRectValue];
                     } completion:^(BOOL finished) {
                         
                         [tgr.view removeFromSuperview];
                     }];
}




////////////////////
// CAMERA CONTROL //
////////////////////
#pragma mark - Camera Controls

// Brings Up Camera UI
- (IBAction)takePhoto:(id)sender {
    
    // Instantiating and presenting camera interface
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // Setting the CameraAppVC as the picker delegate
    picker.delegate = self;
    
    // camera interface and user interaction handled by the system
    
    // picker allows editing
    picker.allowsEditing = YES;
    
    // setting the source type as the camera rather than the media browser
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
}

// Selects photo from camera roll when Create Meme button pressed
- (IBAction)selectPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

// Handles selected image, will present CreateViewController
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        self.pickedImage = chosenImage;
    }
    else
    {
        UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
        self.pickedImage = chosenImage;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self presentCreateMemeViewController:self];
}


////////////////
// NAVIGATION //
////////////////
#pragma mark - Navigation

// Presenting CreateMeme programatically because it can be presented by either taking a camera or selecting an image
- (void) presentCreateMemeViewController: (id)sender
{
    CreateViewController *createVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateMeme"];
    
    createVC.passedImage = self.pickedImage;
    
    [self.navigationController pushViewController:createVC animated:YES];
}





















@end