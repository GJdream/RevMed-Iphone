//
//  ChartViewController.h
//  Revmed
//
//  Created by Nader on 5/24/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "WSLineChartView.h"
#import "WSAreaChartView.h"
#import "WSChartObject.h"
#import "SQLManager.h"
#import "Score.h"
#import "ScoreDAO.h"

@interface ChartViewController : UIViewController

@property (nonatomic, strong) UIView *chartView;
@property (nonatomic) BOOL flag;
@property (nonatomic) NSArray *scores;
@property (nonatomic) NSString* currentPseudo;
@end
