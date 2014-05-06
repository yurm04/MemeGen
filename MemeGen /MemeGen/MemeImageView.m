//
//  MemeImageView.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/21/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "MemeImageView.h"

@implementation MemeImageView

- (id)initWithImage: (UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        self.image = image;
        self.bounds = super.frame;
        self.clipsToBounds = YES;
        
        
        // Adding tap gesture recognizer
        self.userInteractionEnabled = YES;      // Have to make sure it's enabled!
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addTextWithTapRecognizer:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void) prepareImage
{
    self.bounds = super.frame;
    self.clipsToBounds = YES;

    self.userInteractionEnabled = YES;      // Have to make sure it's enabled!
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addTextWithTapRecognizer:)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];

}

#define MAX_TEXT_VIEWS 2

- (void) addTextWithTapRecognizer:(UITapGestureRecognizer *)tap
{
    // capped at however many is too many
    if ([[self subviews]count] < MAX_TEXT_VIEWS) {
        
        // Create textView at tap location
        CGPoint tapPoint = [tap locationInView:self];
        CGRect memeTextFrame = CGRectMake(tapPoint.x, tapPoint.y, self.superview.frame.size.width, self.superview.frame.size.height / 3);
        MemeTextView *memeText = [[MemeTextView alloc]initWithFrame:memeTextFrame];
        
        

        [self addSubview:memeText];
    }
    
}

@end