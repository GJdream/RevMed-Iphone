//
//  ObjectiveTableViewController.m
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "ObjectiveTableViewController.h"

@implementation ObjectiveTableViewController

@synthesize currentSpeciality, mode;


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    QuestionViewController *view = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Objective* s = [list objectAtIndex:[path row]];
    [view setCurrentObjective: s];
    [view setMode: self.mode];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"objSegue" sender:nil];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

        SQLManager  *manager = [SQLManager open];
    ObjectiveDAO *dao = [[ObjectiveDAO alloc] initWithSQLManager:manager];
    list = [dao getAllObjectivesFromSpecialityId:[currentSpeciality _id]];
    [self setTitle:[currentSpeciality speciality]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    // Configure the cell...
    
    Objective *str = [list objectAtIndex:[indexPath row]];
    
   
    [cell.textLabel setText:[str objective]];
    UIFont *myFont = [ UIFont fontWithName: @"Helvetica" size: 16.0 ];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = myFont;
    CGRect frame = cell.textLabel.frame;
    frame.size.height = 60;
    frame.origin.y = 0;
    cell.textLabel.frame = frame;
    
    // Retrieve an image
	NSString *imagefile = [[NSBundle mainBundle] pathForResource:@"7arboucha_2" ofType:@"png"];
	UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagefile];
	// Add the image to the table cell
	[[cell imageView]setImage:image];
    
    
    // accessory type
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
