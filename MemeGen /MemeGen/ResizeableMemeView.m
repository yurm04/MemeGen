//
//  ResizeableMemeView.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/22/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "ResizeableMemeView.h"
#import "MemeTextView.h"

@implementation ResizeableMemeView

- (id)initWithFrame:(CGRect)frame image: (UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [self addSubview:imageView];
        imageView.center = self.center;
        
        // adding tap gesture recognizer
        self.userInteractionEnabled = YES;      // Have to make sure it's enabled!
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addTextWithTapRecognizer:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}


- (void) addTextWithTapRecognizer:(UITapGestureRecognizer *)tap
{
    
    NSLog(@"Tap Detected");
    
    // Creating text frame CGRect
    CGRect memeTextFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y - 100, self.frame.size.width, self.frame.size.height/3);
    CGPoint point = self.frame.origin;
    NSLog(@"TFP %f %f",memeTextFrame.origin.x, memeTextFrame.origin.y);
    NSLog(@"IFP %f %f", self.frame.origin.x, self.frame.origin.y);
    NSLog(@"IS %f %f", self.frame.size.width, self.frame.size.height);
    NSLog(@"%f %f", point.x, point.y);
    MemeTextView *memeText = [[MemeTextView alloc]initWithFrame:memeTextFrame];
    [self addSubview:memeText];
    
    
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
