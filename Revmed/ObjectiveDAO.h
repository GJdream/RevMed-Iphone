//
//  ObjectiveDAO.h
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Speciality.h"
#import "Objective.h"
#import "SQLManager.h"
@interface ObjectiveDAO : NSObject {
    
    SQLManager *manager;
}

-(id) initWithSQLManager: (SQLManager*) manager;
-(NSArray*) getAllObjectivesFromSpecialityId: (int) specialityId;
@end
