//
//  MemeTextView.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MemeTextView.h"

@implementation MemeTextView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bounds = super.frame;
        self.clipsToBounds = YES;
        
        // Initialization code
        self.userInteractionEnabled = YES;
        self.text = @"Some Text";
        self.editable = YES;
        self.allowsEditingTextAttributes = YES;
        self.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor blackColor];
        
        // Removing select gesture recognizers in textView to implement my own
        for (UIGestureRecognizer *gesture in self.gestureRecognizers){
            if ([(UITapGestureRecognizer *)gesture isKindOfClass:[UITapGestureRecognizer class]]) {
                if ([(UITapGestureRecognizer *)gesture numberOfTapsRequired] == 1 &&
                [(UITapGestureRecognizer *)gesture numberOfTouchesRequired] == 1)
                {
                    [gesture setEnabled:NO];
                }
                if ([(UITapGestureRecognizer *)gesture numberOfTapsRequired] == 2 &&
                    [(UITapGestureRecognizer *)gesture numberOfTouchesRequired] == 1)
                {
                    [gesture setEnabled:NO];
                }
            }
            if ([(UIPinchGestureRecognizer *)gesture isKindOfClass:[UIPinchGestureRecognizer class]] ) {
                [gesture setEnabled:NO];
            }
        }

        // Single tap to resign keyboard
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textViewShouldEndEditing:)];
        singleTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleTap];
        
        // Long press gesture recognizer for editing
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(textViewShouldBeginEditing:)];
        longPress.minimumPressDuration = 3;     // change this to a constant later
        [self addGestureRecognizer:longPress];
        
        
        // Pan gesture recognizer for moving text
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [self addGestureRecognizer:panGesture];
        // have to make something for it to become enabled and disabled...
        
        // Pinch gesture recognizer for scaling text size
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(changeFontSizeWithPinch:)];
        [self addGestureRecognizer:pinchGesture];
        pinchGesture.enabled = YES;
        
    }
    return self;
}

#define MAX_SIZE 42
#define MIN_SIZE 13
- (void) changeFontSizeWithPinch: (UIPinchGestureRecognizer *) recognizer
{
    UIFont *font = self.font;
	CGFloat pointSize = font.pointSize;
	NSString *fontName = font.fontName;
    
	pointSize = ((recognizer.velocity > 0) ? 1 : -1) * 1 + pointSize;
	
	if (pointSize < MIN_SIZE) pointSize = MIN_SIZE;
	if (pointSize > MAX_SIZE) pointSize = MAX_SIZE;
	
	self.font = [UIFont fontWithName:fontName size:pointSize];
	
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [self becomeFirstResponder];
    return YES;
}

- (BOOL) textViewShouldEndEditing:(UITextView *)textView {
    [self resignFirstResponder];
    return YES;
}

- (void) handlePan: (UIPanGestureRecognizer *) recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
