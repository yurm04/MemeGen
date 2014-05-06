//
//  MemeImageView.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemeText.h"
#import "MemeTextView.h"

@interface MemeImageView : UIImageView

- (id)initWithImage: (UIImage *)image;  //WithFrame:(CGRect)frame image: (UIImage *)image;

- (void) addTextWithTapRecognizer: (UITapGestureRecognizer *)tap; // using tap gesture recognizer

- (void) prepareImage;

@end