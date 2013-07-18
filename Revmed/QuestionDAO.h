//
//  QuestionDAO.h
//  Revmed
//
//  Created by Nader on 5/21/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "SQLManager.h"
#import "Objective.h"
#import "Question.h"

@interface QuestionDAO : NSObject {
    
    SQLManager *manager;
}

-(id) initWithSQLManager: (SQLManager*) manager;
-(NSArray*) getQuestionsByObjectiveId: (int) objectiveId;
@end
