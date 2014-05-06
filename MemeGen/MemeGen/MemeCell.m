//
//  MemeCell.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/26/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MemeCell.h"

@interface MemeCell()

@property(nonatomic, weak) IBOutlet UIImageView *photoImageView;

@end

@implementation MemeCell

- (void) setMeme: (NSString *)path
{
    self.memeURL = path;
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
    [library assetForURL:[NSURL URLWithString:path] resultBlock:^(ALAsset *asset){
        self.image = [UIImage imageWithCGImage:[asset thumbnail]];
        self.photoImageView.image = self.image;
    }failureBlock:^(NSError *error){
        NSLog(@"Error in block");
    }];
}

- (ALAsset *) memeAsset
{
    if (!_memeAsset) {
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
        [library assetForURL:[NSURL URLWithString:self.memeURL] resultBlock:^(ALAsset *asset){
            _memeAsset = asset;
            NSLog(@"%@", _memeAsset);
        }failureBlock:^(NSError *error){
            NSLog(@"Error in block");
        }];
    }
    return _memeAsset;
}

@end
