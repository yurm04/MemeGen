//
//  ResizeableViewController.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/22/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "SPUserResizableView.h"
#import <UIKit/UIKit.h>

@interface ResizeableViewController : UIViewController <UIGestureRecognizerDelegate, SPUserResizableViewDelegate> {
    SPUserResizableView *currentlyEditingView;
    SPUserResizableView *lastEditedView;
}

@end