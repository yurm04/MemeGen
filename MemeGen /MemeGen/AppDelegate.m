//
//  AppDelegate.m
//  MemeGen
//
//  Created by Yuraima Estevez on 4/15/14.
//  Copyright (c) 2014 com.yestevez. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // DB Setup
    NSString *docsDir;
    NSArray *dirPath;
    
    // Getting the documents directory
    dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPath[0];
    
    // Build the path to the database file
    self.databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"MemeGen.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: self.databasePath ] == NO)
    {
        const char *dbpath = [self.databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_memeGenDB) == SQLITE_OK)
        {
            char *errMsg;
            
            // Creates MemeGen table if one doesn't already exist
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS memes (ID INTEGER PRIMARY KEY AUTOINCREMENT, url TEXT, date TEXT)";
            
            // Logs to see what's going on
            if (sqlite3_exec(self.memeGenDB, sql_stmt, NULL, NULL, &errMsg) == SQLITE_OK)
            {
                NSLog(@"Created table");
            }
            
            sqlite3_close(self.memeGenDB);
            
        }
        else {
            NSLog(@"Failed to open/create database");
        }
    }

    return YES;
}

- (void) insertImageURL: (NSURL *)url
{
    sqlite3_stmt    *statement;
    const char *dbpath = [self.databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_memeGenDB) == SQLITE_OK)
    {
        NSString *imageURL = [NSString stringWithFormat:@"%@", url];
        NSString *date = [NSString stringWithFormat:@"%@", [NSDate date]];
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO memes (url, date) VALUES (\"%@\", \"%@\")",
                               imageURL, date];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(self.memeGenDB, insert_stmt,
                           -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            NSLog(@"photo saved");
        } else {
           
            NSLog(@"photo not saved");
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(self.memeGenDB);
    }
}

- (NSMutableArray *) populateImages
{
    const char *dbpath = [self.databasePath UTF8String];
    sqlite3_stmt    *statement;
    NSMutableArray *images = [[NSMutableArray alloc]init];
    
    if (sqlite3_open(dbpath, &_memeGenDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT url FROM memes"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(self.memeGenDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *fileURL = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                [images addObject:fileURL];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(self.memeGenDB);
    }
    return images;
}

// Getter for databasePath property
- (NSString *) databasePath
{
    if (!_databasePath) {
        NSString *docsDir;
        NSArray *dirPath;
        
        // Getting the documents directory
        dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        docsDir = dirPath[0];
        
        // Build the path to the database file
        _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"MemeGen.db"]];
    }
    return _databasePath;
}

@end
