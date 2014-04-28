//
//  MemeImageView.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MemeImageView.h"


@implementation MemeImageView

#warning to scale images, self.contentMode = UIUIViewContentModeScaleAspectFit

- (id)initWithImage: (UIImage *)image //Frame:(CGRect)frame
{
    self = [super initWithImage:image];
    if (self) {
        self.image = image;
        self.bounds = super.frame;
        self.clipsToBounds = YES;
        
        // adding tap gesture recognizer
        self.userInteractionEnabled = YES;      // Have to make sure it's enabled!
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addTextWithTapRecognizer:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}


#define MAX_TEXT_VIEWS 2

- (void) addTextWithTapRecognizer:(UITapGestureRecognizer *)tap
{
    
    NSLog(@"Tap Detected");
    
    // capped at however many is too many
    if ([[self subviews]count] < MAX_TEXT_VIEWS) {
        // Creating text frame CGRect
        CGPoint tapPoint = [tap locationInView:self];
        //CGRect memeTextFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y - 100, self.frame.size.width - 20, self.frame.size.height - 20);
        CGRect memeTextFrame = CGRectMake(tapPoint.x, tapPoint.y, self.superview.frame.size.width, self.superview.frame.size.height / 3);
        MemeTextView *memeText = [[MemeTextView alloc]initWithFrame:memeTextFrame];
        [self addSubview:memeText];
    }
    
}













/*
 - (id)initWithFrame:(CGRect)frame
 {
 self = [super initWithFrame:frame];
 if (self) {
 
 }
 return self;
 }
 
 - (id) initWithImage:(UIImage *)image {
 
 self = [super initWithImage:image];
 if (self) {
 self.image = image;
 // adding tap gesture recognizer
 self.userInteractionEnabled = YES;      // Have to make sure it's enabled!
 UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addTextWithTapRecognizer:)];
 tap.numberOfTapsRequired = 2;
 [self addGestureRecognizer:tap];
 }
 return self;
 }
 
 */
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end