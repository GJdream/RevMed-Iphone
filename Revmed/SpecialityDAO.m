//
//  SpecialityDAO.m
//  testbase
//
//  Created by Nader on 5/18/13.
//  Copyright (c) 2013 Nader. All rights reserved.
//

#import "SpecialityDAO.h"

@implementation SpecialityDAO
-(id) initWithSQLManager: (SQLManager*) m{
    self->manager = m;
    return self;
}
-(NSArray*) getAllSpecialities{
    NSMutableArray *specs = [[NSMutableArray alloc] init];
    NSString *req = @"select * from specialities;";
     sqlite3_stmt *stmt;
     
     if(sqlite3_prepare_v2([manager database], [req UTF8String] , -1, &stmt, nil) == SQLITE_OK)
     {
         while(sqlite3_step(stmt) == SQLITE_ROW) {
             NSLog(@"yesline");
             int id = sqlite3_column_int(stmt, 0);
             char *spec = (char*) sqlite3_column_text(stmt, 1);
             NSString *s = [[NSString alloc] initWithUTF8String:spec];
             NSLog(@"spec: %d is %@", id, s);
             Speciality* ss = [[Speciality alloc] init];
             [ss set_id:id];
             [ss setSpeciality:s];
             [specs addObject:ss];
         }
         sqlite3_finalize(stmt);
     }
     else
         NSLog(@"noline");
    return specs;
}
@end
