//
//  MenuViewController.m
//  Revmed
//
//  Created by Nader on 5/22/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "MenuViewController.h"

@implementation MenuViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"scoreSegue"])
        return;
    
    SpecialityTableViewController *special = [segue destinationViewController];
 
    if([segue.identifier isEqualToString:@"examSegue"])
        [special setMode: 0];
    else
        [special setMode: 1];
    NSLog(@"mode: %d", [special mode]);
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
