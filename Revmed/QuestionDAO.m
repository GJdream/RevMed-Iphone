//
//  QuestionDAO.m
//  Revmed
//
//  Created by Nader on 5/21/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "QuestionDAO.h"

@implementation QuestionDAO

-(id) initWithSQLManager: (SQLManager*) m
{
    self->manager = m;
    return self;    
}
-(NSArray*) getQuestionsByObjectiveId: (int) objectiveId
{
    NSMutableArray *objs = [[NSMutableArray alloc] init];
    
    NSString *req = [[NSString alloc] initWithFormat: @"SELECT questions._id, questions.question, questions.objective_id, revisions.revision FROM questions INNER JOIN revisions ON revisions.question_id = questions._id WHERE objective_id = %d ORDER BY RANDOM() LIMIT 5;", objectiveId];
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2([manager database], [req UTF8String] , -1, &stmt, nil) == SQLITE_OK)
    {
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            int _id = sqlite3_column_int(stmt, 0);
            
            char *question = (char*) sqlite3_column_text(stmt, 1);
            NSString *s = [[NSString alloc] initWithUTF8String:question];
            int objId = sqlite3_column_int(stmt, 2);
            
            char *rev = (char*) sqlite3_column_text(stmt, 3);
            NSString *revision = [[NSString alloc] initWithUTF8String:rev];
            
            Question* oo = [[Question alloc] init];
            
            [oo set_id: _id];
            [oo setQuestion: s];
            [oo setObjectiveId: objId];
            [oo setRevision:revision];
            
            [objs addObject:oo];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"noline");
    return objs;
}
@end
