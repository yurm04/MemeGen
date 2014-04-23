//
//  MemeText.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeText : UITextField <UITextFieldDelegate>

- (void) moveTextFieldWithRecognizer: (UILongPressGestureRecognizer *) recognizer;
- (void) editWithDoubleTap: (UITapGestureRecognizer *) doubleTap;
@end
