//
//  ResizeableMemeView.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/22/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "SPUserResizableView.h"

@interface ResizeableMemeView : SPUserResizableView



- (id)initWithFrame:(CGRect)frame image: (UIImage *)image;

- (void) addTextWithTapRecognizer: (UITapGestureRecognizer *)tap; // using tap gesture recognizer

@end
