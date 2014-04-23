//
//  MemeTextView.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeTextView : UITextView <UITextViewDelegate>

- (void) changeFontStyle;

- (void) changeFontSizeWithPinch: (UIPinchGestureRecognizer *) recognizer;
@end
