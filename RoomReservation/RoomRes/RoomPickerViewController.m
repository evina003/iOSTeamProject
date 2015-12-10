//
//  RoomPickerViewController.m
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "RoomPickerViewController.h"

@implementation RoomPickerViewController

@synthesize rooms,roomTableView, selectedRoom, searResults, searchBar, searchDisplayController;

-(void)populateArray
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Room" inManagedObjectContext:context];
    [rq setEntity:desc];
    [rq setResultType: NSDictionaryResultType];
    NSError *err;
    
    rooms = [context executeFetchRequest:rq error:&err];
    
    searchBar.frame = CGRectMake(0 , self.navigationController.navigationBar.frame.origin.y + searchBar.frame.size.height, 320, 44);
    searchBar.delegate = self;
    searchBar.showsCancelButton = TRUE;
    [searchBar setHidden:NO];
    [searchBar becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searResults = [[NSArray alloc] init];
    [self populateArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark Table View Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searResults count];
    } else {
        return [self.rooms count];
    }
   // return [rooms count]; //this was changed
}

#pragma mark -
#pragma mark Table View Delegate Methods

// provide the name to assign to requested cell

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    
    static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SectionsTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:SectionsTableIdentifier];
    }
    
    
    NSString *roomNumber;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        roomNumber = [NSString stringWithFormat:@"%@", [[searResults objectAtIndex:row] objectForKey:@"roomNum"]];
        cell.textLabel.text = roomNumber;
    }
    else
    {
        roomNumber = [NSString stringWithFormat:@"%@", [[rooms objectAtIndex:row] objectForKey:@"roomNum"]];
        cell.textLabel.text = roomNumber;
    }
    
    return cell;
}

// Provide the title to use for the requested section

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    NSString *key = @"";
    return key;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    TimePickerViewController *nextController = [[TimePickerViewController alloc] init];
    nextController.rNum = [[rooms objectAtIndex:row] objectForKey:@"roomNum"];
    [self.navigationController pushViewController:nextController
                                         animated:YES];
}
/*************SEARCH********/
-(void) filterContentForSearchText:(NSString *) searchText scope: (NSString *)scope
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"roomNum beginswith[c] %@", searchText];
    self.searResults = [rooms filteredArrayUsingPredicate:pred];
}
-(BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return  YES;
}
@end
