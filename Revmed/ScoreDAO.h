//
//  ScoreDAO.h
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLManager.h"
#import "Score.h"

@interface ScoreDAO : NSObject {
    SQLManager* manager;
}

-(id) initWithSQLManager: (SQLManager*) manager;
-(NSArray*) getAllScores;
-(void) insertNewScore: (Score *) s;
@end
