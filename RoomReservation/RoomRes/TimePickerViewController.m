//
//  TimePickerViewController.m
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "TimePickerViewController.h"

@interface TimePickerViewController ()

@end

@implementation TimePickerViewController

@synthesize rNum, availTimes;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateData
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Reservation" inManagedObjectContext:context];
    [rq setEntity:desc];
    [rq setResultType: NSDictionaryResultType];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"roomNum == %@", rNum];
    [rq setPredicate:pred];
    NSError *err;
    
    availTimes = [context executeFetchRequest:rq error:&err];
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
    return [availTimes count];
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
    
    NSString *time = [NSString stringWithFormat:@"%@", [[availTimes objectAtIndex:row] objectForKey:@"time"]];
    cell.textLabel.text = time;
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
    ReasonPickerViewController *nextController = [[ReasonPickerViewController alloc] init];
    [self.navigationController pushViewController:nextController
                                         animated:YES];
}


@end
