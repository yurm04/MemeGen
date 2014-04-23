//
//  MemeTextView.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MemeTextView.h"

@implementation MemeTextView

#warning textView is not contrained to bounds!

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
        self.backgroundColor = [UIColor yellowColor];
        //[self becomeFirstResponder];
        

        // removing select gesture recognizers to implement my own
        
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
        
        
        // double tap editing gesture recognizer
        /* leave just in case...
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textViewShouldEndEditing:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        doubleTap.enabled = YES;
        */
        
        // single tap to resign keyboard
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textViewShouldEndEditing:)];
        singleTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleTap];
        
        // long press gesture recognizer for moving textview
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(textViewShouldEndEditing:)];
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
        NSLog(@"%@", self.gestureRecognizers);
        
    }
    return self;
}

- (void) changeFontSizeWithPinch: (UIPinchGestureRecognizer *) recognizer
{
    NSLog(@"is this working");
    UIFont *font = self.font;
    NSLog(@"%@", font);
	CGFloat pointSize = font.pointSize;
	NSString *fontName = font.fontName;
    
	pointSize = ((recognizer.velocity > 0) ? 1 : -1) * 1 + pointSize;
	
	if (pointSize < 13) pointSize = 13;
	if (pointSize > 42) pointSize = 42;
	
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
