//
//  ChoiceDAO.m
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "ChoiceDAO.h"

@implementation ChoiceDAO


-(id) initWithSQLManager: (SQLManager*) m
{
    self->manager = m;
    return self;
}


-(NSArray*) getChoicesByQuestionId: (int) questionId {
    
    NSMutableArray *objs = [[NSMutableArray alloc] init];
    
    NSString *req = [[NSString alloc] initWithFormat: @"select * from choices WHERE question_id = %d;", questionId];
    sqlite3_stmt *stmt;
    
    if(sqlite3_prepare_v2([manager database], [req UTF8String] , -1, &stmt, nil) == SQLITE_OK)
    {
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            int _id = sqlite3_column_int(stmt, 0);
            
            char *question = (char*) sqlite3_column_text(stmt, 1);
            NSString *s = [[NSString alloc] initWithUTF8String:question];
            
            int qId = sqlite3_column_int(stmt, 2);
            
            int state = sqlite3_column_int(stmt,3);
            
            Choice* oo = [[Choice alloc] init];
            
            [oo set_id: _id];
            [oo setChoice: s];
            [oo setQuestionId: qId];
            [oo setState: state];
            [oo setIsSelected: NO];
            
            [objs addObject:oo];
        }
        sqlite3_finalize(stmt);
    }
    else
        NSLog(@"noline");
    return objs;

}
@end
