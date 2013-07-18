//
//  QuestionViewController.m
//  ;
//
//  Created by Nader on 5/21/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "QuestionViewController.h"


@implementation QuestionViewController

@synthesize currentObjective, labelQuestion, isModeExam, mode, score;

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if(mode == 1)
        if([identifier isEqualToString:@"revisionSegue"])
            return YES;
    return NO;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(mode == 1)
        if([segue.identifier isEqualToString:@"revisionSegue"])
        {
            RevisionViewController *controller = [segue destinationViewController];
        
            Question *q = [listQuestions objectAtIndex:currentQuestionIndex - 1];
        
            [controller setQuestion: q];
        }
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
    /*labelQuestion.layer.borderColor = [UIColor blackColor].CGColor;
    labelQuestion.layer.borderWidth = 2.0;*/
    
    caracs = [[NSMutableArray alloc] initWithCapacity:5];
    [caracs addObject:@"A. "];
    [caracs addObject:@"B. "];
    [caracs addObject:@"C. "];
    [caracs addObject:@"D. "];
    [caracs addObject:@"E. "];
    if(mode == 1)
    {
        [self.scoreOutlet setHidden: YES];
        [self.nextQuestionOutlet setTitle: @"Révision" forState:UIControlStateNormal];
    }
    else
    {
        [self.scoreOutlet setText: @"Score: 0.00"];
        
    }
    
    validate = NO;
    [[self nextQuestionOutlet] setHidden: YES];
    currentQuestionIndex = 0;
    SQLManager *manager = [SQLManager open];
    QuestionDAO *dao = [[QuestionDAO alloc] initWithSQLManager:manager];
    listQuestions = [dao getQuestionsByObjectiveId:[currentObjective _id]];
    Question* q = [listQuestions objectAtIndex: currentQuestionIndex];
    ChoiceDAO *dao2 = [[ChoiceDAO alloc] initWithSQLManager:manager];
    listChoices = [dao2 getChoicesByQuestionId: [q _id]];
    [labelQuestion setText: [q question]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonNextQuestion:(id)sender
{
    currentQuestionIndex++;
    
    if(currentQuestionIndex < 5)
    {
        Question* q = [listQuestions objectAtIndex: currentQuestionIndex];
        SQLManager *manager = [SQLManager open];
        ChoiceDAO *dao2 = [[ChoiceDAO alloc] initWithSQLManager:manager];
        listChoices = [dao2 getChoicesByQuestionId: [q _id]];

        [labelQuestion setText: [q question]];
        [[self ValiderOutlet] setHidden: NO];
        [[self nextQuestionOutlet] setHidden: YES];
        validate = NO;
        if(mode == 1)
            [self performSegueWithIdentifier:@"revisionSegue" sender:nil];
    }
    else if(mode == 0)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Revmed" message:@"Voulez-vous sauvegarder votre score?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        textField = [[UITextField alloc] init];
        [textField setBackgroundColor:[UIColor whiteColor]];
        //textField.delegate = self;
        textField.borderStyle = UITextBorderStyleLine;
        textField.frame = CGRectMake(15, 75, 255, 30);
        textField.font = [UIFont fontWithName:@"ArialMT" size:20];
        textField.placeholder = @"Sans nom";
        //textField.textAlignment = UITextAlignmentCenter;
        textField.keyboardAppearance = UIKeyboardAppearanceAlert;
        [textField becomeFirstResponder];
        [alert addSubview:textField];
        [alert show];
    }
    else
    {
         [self.nextQuestionOutlet setTitle: @"Retour vers menu" forState:UIControlStateNormal];
        [self performSegueWithIdentifier:@"menuSegue" sender:nil];
    }
    
    
    [table reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* psd = textField.text;
    NSLog(@"String is: %@, %d", psd, buttonIndex); 
    if ([textField.text length] <= 0 || buttonIndex == 0){
        [self performSegueWithIdentifier:@"menuSegue" sender:nil];
    }
    
    if (buttonIndex == 1) {
        ScoreDAO *dao = [[ScoreDAO alloc] initWithSQLManager:[SQLManager open]];
        Score *sc = [[Score alloc] init];
        [sc setScore: score];
        [sc setPseudo: psd];
        [sc setObjectiveId: [currentObjective _id]];
        
        [dao insertNewScore: sc];
        
        [self performSegueWithIdentifier:@"menuSegue" sender:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listChoices count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"index: %d", [indexPath row]);
    Choice *c =  [listChoices objectAtIndex: [indexPath row]];
    if([c isSelected])
        [c setIsSelected:NO];
    else
        [c setIsSelected:YES];
}

- (void)tableView: (UITableView*)tableView
  willDisplayCell: (UITableViewCell*)cell
forRowAtIndexPath: (NSIndexPath*)indexPath
{
     Choice *str = [listChoices objectAtIndex:[indexPath row]];
    if(validate == YES)
    {
        NSString *imgCorrectFile = [[NSBundle mainBundle] pathForResource:@"img_correct" ofType:@"png"];
        UIImage *imageCorrect = [[UIImage alloc] initWithContentsOfFile: imgCorrectFile];
        
        NSString *imgWrongFile = [[NSBundle mainBundle] pathForResource:@"img_wrong" ofType:@"png"];
        UIImage *imageWrong = [[UIImage alloc] initWithContentsOfFile: imgWrongFile];
        
        if([str isSelected])
        {
            if([str state] == 1)
            {
                [cell setBackgroundColor: [UIColor greenColor]];
                cell.accessoryView = [[UIImageView alloc] initWithImage: imageCorrect];
            }
            else
            {
                [cell setBackgroundColor: [UIColor redColor]];
                cell.accessoryView = [[UIImageView alloc] initWithImage: imageWrong];
            }
            
        }
        else
        {
            if([str state] == 1)
            {
                [cell setBackgroundColor: [UIColor greenColor]];
                cell.accessoryView = [[UIImageView alloc] initWithImage: imageWrong];
            }
        }
    } 
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    table = tableView;
    static NSString *CellIdentifier = @"CellChoice";
    UITableViewCell *cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    // Configure the cell...
    
    Choice *str = [listChoices objectAtIndex:[indexPath row]];
    
    [cell.textLabel setText:[[NSString alloc] initWithFormat:@"%@ %@", [caracs objectAtIndex:[indexPath row]], [str choice]]];
    UIFont *myFont = [ UIFont fontWithName: @"Helvetica" size: 13.0 ];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = myFont;
    CGRect frame = cell.textLabel.frame;
    frame.size.height = 60;
    frame.origin.y = 0;
    cell.textLabel.frame = frame;    return cell;
}

- (IBAction)validerButton: (id)sender {
    [[self ValiderOutlet] setHidden: YES];
    [[self nextQuestionOutlet] setHidden: NO];
    validate = YES;
    [self calculateScore];
    NSString *scr = [[NSString alloc] initWithFormat:@"Score: %.2f", self.score];
    [self.scoreOutlet setText: scr];
    [table reloadData];
}

-(void) calculateScore
{
    int totalCorrect = 0;
    int correct = 0;
    int wrong = 0;
    
    for(Choice *c in listChoices)
        if([c state] == 1)
            totalCorrect++;

    for(Choice *c in listChoices) {
        if([c isSelected])
        {
            if([c state] == 1)
            {
                correct++;
            }
            else
            {
                wrong++;
            }
        }
    }
    score += (float)( correct * (1 / (float) totalCorrect) ) * ( 1 / (float)(wrong + 1) );
    
}

@end
