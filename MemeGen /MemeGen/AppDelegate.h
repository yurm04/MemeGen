//
//  AppDelegate.h
//  MemeGen
//
//  Created by Yuraima Estevez on 4/15/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Database Stuff
@property (nonatomic) sqlite3 *memeGenDB;
@property (strong, nonatomic) NSString *databasePath;

- (void) insertImageURL: (NSURL *)url;
- (NSMutableArray *) populateImages;

@end
