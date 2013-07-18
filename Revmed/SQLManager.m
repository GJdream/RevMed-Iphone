//
//  SQLManager.m
//  testbase
//
//  Created by Nader on 5/18/13.
//  Copyright (c) 2013 Nader. All rights reserved.
//

#import "SQLManager.h"

@implementation SQLManager

static SQLManager* databaselite;
@synthesize database;

+(SQLManager*) open {
    if(databaselite == nil)
        databaselite = [[SQLManager alloc] init];
    
    return databaselite;
    
}

-(id)init {
    self = [super init];
    if(self) {
        NSString *sqldb = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite" ];
        if(sqlite3_open([sqldb UTF8String], &database) == SQLITE_OK)
           NSLog(@"BASE OKAY");
        
        else
            NSLog(@"ERROR!");
    }
    return self;
}

-(void) dealloc {
    sqlite3_close(database);
}

@end
