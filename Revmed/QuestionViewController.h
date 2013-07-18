//
//  QuestionViewController.h
//  Revmed
//
//  Created by Nader on 5/21/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SQLManager.h"
#import "Objective.h"
#import "Question.h"
#import "QuestionDAO.h" 
#import "Choice.h"
#import "ChoiceDAO.h"
#import "Score.h"
#import "ScoreDAO.h"
#import "RevisionViewController.h"

@interface QuestionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray* listQuestions;
    NSArray* listChoices;
    int currentQuestionIndex;
    UITableView *table;
    BOOL validate;
    UITextField *textField;
    NSMutableArray *caracs;

}
@property (weak, nonatomic) IBOutlet UILabel *scoreOutlet;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionOutlet;
@property (weak, nonatomic) IBOutlet UIButton *ValiderOutlet;
- (IBAction)validerButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion;
@property (nonatomic) BOOL isModeExam;
- (IBAction)buttonNextQuestion:(id)sender;
@property (nonatomic) int mode;
@property (nonatomic, strong) Objective* currentObjective;
@property (nonatomic) float score;


-(void) calculateScore;

@end
