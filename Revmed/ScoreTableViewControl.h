//
//  ScoreTableViewControl.h
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLManager.h"
#import "Score.h"
#import "ScoreDAO.h"
#import "ChartViewController.h"

@interface ScoreTableViewControl : UITableViewController
{
    NSArray *list;
}

@end
