//
//  SpecialityDAO.h
//  testbase
//
//  Created by Nader on 5/18/13.
//  Copyright (c) 2013 Nader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLManager.h"
#import "Speciality.h"
@interface SpecialityDAO : NSObject {
    SQLManager* manager;
}

-(id) initWithSQLManager: (SQLManager*) manager;
-(NSArray*) getAllSpecialities;
@end
