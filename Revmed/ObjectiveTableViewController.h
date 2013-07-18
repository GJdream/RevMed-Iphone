//
//  ObjectiveTableViewController.h
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speciality.h"
#import "Objective.h"
#import "ObjectiveDAO.h"
#import "SQLManager.h"
#import "QuestionViewController.h"

@interface ObjectiveTableViewController : UITableViewController {
    NSArray *list;
}

@property (nonatomic, strong)Speciality* currentSpeciality;
@property (nonatomic) int mode;
@end
