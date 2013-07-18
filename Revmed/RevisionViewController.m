//
//  RevisionViewController.m
//  Revmed
//
//  Created by Nader on 5/23/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "RevisionViewController.h"

@implementation RevisionViewController

@synthesize question;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.revisionOutlet setText: question.revision];
    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextQuestionButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
