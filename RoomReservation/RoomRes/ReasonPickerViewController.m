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
    AppDelegate *adel = [[UIApplication sharedApplication] delegate ];

    UIAlertView *alert;

    if([title isEqualToString:@"Yes"])
    {
        if(adel.current.rID == nil)
        {
            resChoice.reason = [reasons objectAtIndex:[reasonPicker selectedRowInComponent:0]];
            resChoice.rID = [NSString stringWithFormat:@"%d%d%d" ,rand(),rand(),rand()];
            resChoice.taken = @"YES";
            adel.current.rID = resChoice.rID;
            NSError *err;
            if([adel.managedObjectContext save: &err])
            {
                alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Appointment has been made." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            else{
                alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Something went wrong submitting Reservation. Please Try Again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
        else{
            alert = [[UIAlertView alloc] initWithTitle:@"Exception" message:@"You can only have one Reservation at a time. Please Cancel and Try Again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
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
