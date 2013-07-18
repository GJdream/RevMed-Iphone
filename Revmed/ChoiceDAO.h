//
//  ChoiceDAO.h
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLManager.h"
#import "Choice.h"

@interface ChoiceDAO : NSObject {
    
    SQLManager *manager;
}

-(id) initWithSQLManager: (SQLManager*) manager;
-(NSArray*) getChoicesByQuestionId: (int) questionId;

@end
