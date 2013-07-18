//
//  SQLManager.h
//  testbase
//
//  Created by Nader on 5/18/13.
//  Copyright (c) 2013 Nader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLManager : NSObject

@property sqlite3* database;
+(SQLManager *) open;
@end
