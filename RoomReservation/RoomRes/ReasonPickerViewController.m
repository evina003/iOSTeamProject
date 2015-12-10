//
//  ReasonPickerViewController.m
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "ReasonPickerViewController.h"

@interface ReasonPickerViewController ()

@end

@implementation ReasonPickerViewController
@synthesize reasonPicker,resChoice;

- (void)viewDidLoad {
    reasons = [[NSArray alloc] initWithObjects: @"Test", @"Homework", @"Group Assignment", @"Other", nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Yes"])
    {
        resChoice.reason = [reasons objectAtIndex:[reasonPicker selectedRowInComponent:0]];
        AppDelegate *adel = [[UIApplication sharedApplication] delegate ];
        resChoice.rID = [NSString stringWithFormat:@"%d%d%d" ,rand(),rand(),rand()];
        adel.current.rID = resChoice.rID;
        NSError *err;
        [adel.managedObjectContext save: &err];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitReservation:(id)sender
{
  
    UIAlertView *alert;
    
    alert = [[UIAlertView alloc] initWithTitle:@"Submit Reservation" message:@"Are you sure you want to this reservation?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];

}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [reasons count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return reasons[row];
}
@end
