//
//  MainMenuViewController.m
//  RoomRes
//
//  Created by giselle pacheco on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "MainMenuViewController.h"
#import <CoreData/CoreData.h>

@implementation MainMenuViewController

@synthesize cancelButton, resInfo, resID, resRoom, resTime;

-(void)LoadData
{
    // Do any additional setup after loading the view.
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    if(appDelegate.current.rID == nil)
    {
        resID.text = @"No Reservation";
        resInfo.text = @"";
        resTime.text = @"";
        resRoom.text = @"";
    }
    else
    {
        context = [appDelegate managedObjectContext];
        
        NSFetchRequest *rq = [[NSFetchRequest alloc] init];
        NSEntityDescription *desc = [NSEntityDescription entityForName:@"Reservation" inManagedObjectContext:context];
        [rq setEntity:desc];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"rID == %@", appDelegate.current.rID];
        [rq setPredicate:pred];
        
        NSError *err;
        
        NSArray *objects = [context executeFetchRequest:rq error:&err];
        Reservation *temp = [objects objectAtIndex:0];
        resID.text = appDelegate.current.rID;
        resInfo.text = temp.reason;
        resRoom.text = temp.roomNum;
        resTime.text = temp.time;
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [self LoadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadData];
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


- (IBAction)pressCancel:(id)sender {
    
    UIAlertView *alert;
    
    if ([resInfo.text length] == 0) {
        
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You do not have any reservations" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Cancel Reservation" message:@"Are you sure you want to cancel your reservation?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];

        if([title isEqualToString:@"Yes"])
        {
            
            context = [appDelegate managedObjectContext];
            
            NSFetchRequest *rq = [[NSFetchRequest alloc] init];
            NSEntityDescription *desc = [NSEntityDescription entityForName:@"Reservation" inManagedObjectContext:context];
            [rq setEntity:desc];
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"rID == %@", appDelegate.current.rID];
            [rq setPredicate:pred];
            
            NSError *err;
            
            NSArray *objects = [context executeFetchRequest:rq error:&err];
            Reservation *temp = [objects objectAtIndex:0];
            temp.taken = @"NO";
            temp.rID = @"0";
            temp.reason = @"";
            appDelegate.current.rID =nil;
            resInfo.text = @"";
            resID.text = @"No Reservation";
            resTime.text = @"";
            resRoom.text = @"";
            
            [appDelegate.managedObjectContext save: &err];
        }
}
@end

