//
//  ObjectiveDAO.m
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "ObjectiveDAO.h"

@implementation ObjectiveDAO

-(id) initWithSQLManager: (SQLManager*) m{
    self->manager = m;
    return self;
}

-(NSArray*) getAllObjectivesFromSpecialityId:(int) specialityId
{
    NSMutableArray *objs = [[NSMutableArray alloc] init];
    
    NSString *req = [[NSString alloc] initWithFormat: @"select * from objectives WHERE speciality_id = %d;", specialityId];
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2([manager database], [req UTF8String] , -1, &stmt, nil) == SQLITE_OK)
    {
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            NSLog(@"yesline");
            int _id = sqlite3_column_int(stmt, 0);
            
            char *spec = (char*) sqlite3_column_text(stmt, 1);
            NSString *s = [[NSString alloc] initWithUTF8String:spec];
            int specId = sqlite3_column_int(stmt, 2);
            
            
            Objective* oo = [[Objective alloc] init];
            [oo set_id:_id];
            [oo setObjective:s];
            [oo setSpec_id:specId];
            [objs addObject:oo];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"noline");
    return objs;
}

@end
