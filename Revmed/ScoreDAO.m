//
//  ScoreDAO.m
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "ScoreDAO.h"

@implementation ScoreDAO

-(id) initWithSQLManager: (SQLManager*) m
{
    self->manager = m;
    return self;
}
-(NSArray*) getAllScores
{
    NSMutableArray *objs = [[NSMutableArray alloc] init];
    
    NSString *req = [[NSString alloc] initWithFormat: @"select * from scores;"];
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2([manager database], [req UTF8String] , -1, &stmt, nil) == SQLITE_OK)
    {
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            int _id = sqlite3_column_int(stmt, 0);
            
            float score = sqlite3_column_double(stmt, 1);
            
            char *p = (char*) sqlite3_column_text(stmt, 2);
            NSString *psd = [[NSString alloc] initWithUTF8String:p];
            
            char *d = (char*) sqlite3_column_text(stmt, 3);
            NSString *date = [[NSString alloc] initWithUTF8String:d];
            
            int objId = sqlite3_column_int(stmt, 4);
        
            
            Score* oo = [[Score alloc] init];
            
            [oo set_id: _id];
            [oo setPseudo: psd];
            [oo setScore: score];
            [oo setObjectiveId: objId];
            [oo setDate: date];
            
            [objs addObject:oo];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"noline");
    return objs;

    
}
-(void) insertNewScore: (Score *) s
{
    NSString *req = [[NSString alloc] initWithFormat: @"INSERT INTO scores(score, pseudo, objective_id) values (?, ?, ?);"];
    
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2([manager database], [req UTF8String] , -1, &stmt, nil) == SQLITE_OK)
    {
        sqlite3_bind_double(stmt, 1, [s score]);
        sqlite3_bind_text(stmt, 2, [[s pseudo] UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_int(stmt, 3, [s objectiveId]);
        sqlite3_step(stmt);
    }
    
}
@end
