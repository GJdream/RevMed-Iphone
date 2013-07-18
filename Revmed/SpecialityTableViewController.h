//
//  SpecialityTableViewController.h
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speciality.h"
#import "SpecialityDAO.h"
#import "SQLManager.h"
#import "ObjectiveTableViewController.h"

@interface SpecialityTableViewController : UITableViewController {
    NSArray *list;
    NSMutableArray *icons;
}
@property (nonatomic) int mode;


@end
