//
//  MemeCell.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/26/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AssetsLibrary;

@interface MemeCell : UICollectionViewCell

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) ALAsset *memeAsset;
@property (strong, nonatomic) NSString *memeURL;
- (void) setMeme: (NSString *)path;


@end
