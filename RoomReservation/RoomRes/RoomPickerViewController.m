//
//  RoomPickerViewController.m
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "RoomPickerViewController.h"

@interface RoomPickerViewController ()

@end

@implementation RoomPickerViewController

@synthesize rooms,roomTableView, selectedRoom;


-(void)enableSearch
{
}


-(void)populateArray
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Room" inManagedObjectContext:context];
    [rq setEntity:desc];
    [rq setResultType: NSDictionaryResultType];
    [rq setPropertiesToFetch:@[@"roomNum"]];
    NSError *err;
    
    rooms = [context executeFetchRequest:rq error:&err];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self populateArray];
    
    UIBarButtonItem *newButton = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Search"
                                  style:UIBarButtonItemStyleDone
                                  target:self
                                  action:@selector(enableSearch)];
    
    self.navigationItem.rightBarButtonItem = newButton;
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
    return [rooms count];
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
    
    Room *room = [rooms objectAtIndex:row];
    NSString *roomNumber = [NSString stringWithFormat:@"%@", room.roomNum];
    cell.textLabel.text = roomNumber;
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
    selectedRoom = [rooms objectAtIndex:row];
    
}


@end
