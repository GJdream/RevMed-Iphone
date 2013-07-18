//
//  RevisionViewController.h
//  Revmed
//
//  Created by Nader on 5/23/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h" 

@interface RevisionViewController : UIViewController
{
}
- (IBAction)nextQuestionButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *revisionOutlet;

@property (nonatomic) Question *question;

@end
