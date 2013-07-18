//
//  SpecialityTableViewController.m
//  Revmed
//
//  Created by Nader on 5/19/13.
//  Copyright (c) 2013 SIM. All rights reserved.
//

#import "SpecialityTableViewController.h"

@implementation SpecialityTableViewController


@synthesize mode;

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ObjectiveTableViewController *objective = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Speciality* s = [list objectAtIndex:[path row]];
    
    [objective setCurrentSpeciality:s];
    [objective setMode: self.mode];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
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

    SQLManager *manager = [SQLManager open];
    SpecialityDAO *dao = [[SpecialityDAO alloc] initWithSQLManager:manager];
    list = [dao getAllSpecialities];
    icons = [[NSMutableArray alloc] initWithCapacity:8];
    for(int i = 0; i < 9; i++)
        [icons addObject:[[NSString alloc] initWithFormat:@"spec_icone_%d", i]];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self performSegueWithIdentifier:@"specSegue" sender:nil];
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
    
    Speciality *str = [list objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[str speciality]];
    // Retrieve an image
	NSString *imagefile = [[NSBundle mainBundle] pathForResource:[icons objectAtIndex:[indexPath row]+1] ofType:@"png"];
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
