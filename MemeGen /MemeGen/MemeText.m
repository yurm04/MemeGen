//
//  MemeText.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MemeText.h"

@implementation MemeText


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.placeholder = @"Enter Text";
        self.userInteractionEnabled = YES;
        //self.backgroundColor = [UIColor blueColor];
        
        // double tap editing gesture recognizer
        self.enabled = NO;
        self.gestureRecognizers = nil;
        NSLog(@"%@",self.gestureRecognizers);
        
        /*
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textFieldShouldBeginEditing:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        
        
        
        // adding gesture recognizers
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(moveTextFieldWithRecognizer:)];
        longPress.minimumPressDuration = 3;     // change this to a constant later
        [self addGestureRecognizer:longPress];
        NSLog(@"%@",self.gestureRecognizers);
        */
        
    }
    return self;
}

- (void) editWithDoubleTap: (UITapGestureRecognizer *) doubleTap
{
    NSLog(@"Double tap detected");
    [self setEnabled:YES];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    if ([self isFirstResponder] && [touch view] != self) {
        
        [self resignFirstResponder];
    }else if ([[touches anyObject] tapCount] == 2) {
        self.enabled = YES;
        [self textFieldShouldBeginEditing:self];
    }

    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"tapped 2");
    [self becomeFirstResponder];
    return YES;
}


- (void) moveTextFieldWithRecognizer: (UILongPressGestureRecognizer *) recognizer
{
    NSLog(@"long press detected");
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
