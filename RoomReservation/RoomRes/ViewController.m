//
//  ViewController.m
//  RoomRes
//
//  Created by giselle pacheco on 12/6/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import "AppDelegate.h"

@implementation ViewController

@synthesize username, password, passlabel, userlabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    NSManagedObject *giselle = [NSEntityDescription insertNewObjectForEntityForName: @"Users" inManagedObjectContext: context];
    
    NSManagedObject *manny = [NSEntityDescription insertNewObjectForEntityForName: @"Users" inManagedObjectContext: context];
    
    NSLog(@"hello");
    
    [giselle setValue:@"gpach002" forKey:@"username"];
    [giselle setValue:@"iLoveJessicaJones" forKey:@"password"];
    
    [manny setValue:@"evinas003" forKey:@"username"];
    [manny setValue:@"iLoveSM" forKey:@"password"];
    
    NSError *err = nil;
    
    if([context save:&err]){
        NSLog(@"Yay?");
    }
    else{
        NSLog(@"FAILURE");
    }
    
    NSLog(@"%@", giselle);
    NSLog(@"object saved");
    
    NSLog(@"%@", manny);
    NSLog(@"object saved");
}

/*
-(void) viewWillAppear:(BOOL)animated
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    [rq setEntity:desc];
    [rq setResultType:NSDictionaryResultType];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"touchID == 1"];
    [rq setPredicate:pred];
    [rq setPropertiesToFetch:@[@"password"]];
    NSError *err;
    
    NSArray *objects = [context executeFetchRequest:rq error:&err];
    
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Touch ID Test to show Touch ID working in a custom app";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError])
    {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success)
                                {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [self performSegueWithIdentifier:@"Main" sender:nil];
                                    });
                                }
                                else
                                {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                            message:error.description
                                                                                           delegate:self
                                                                                  cancelButtonTitle:@"OK"
                                                                                  otherButtonTitles:nil, nil];
                                        [alertView show];
                                        // Rather than show a UIAlert here, use the error to determine if you should push to a keypad for PIN entry.
                                    });
                                }
                            }];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:authError.description
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil, nil];
            [alertView show];
            // Rather than show a UIAlert here, use the error to determine if you should push to a keypad for PIN entry.
        });
    }
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)pressLogin: (id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    [rq setEntity:desc];
    [rq setResultType:NSDictionaryResultType];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"username == %@", username.text];
    [rq setPredicate:pred];
    [rq setPropertiesToFetch:@[@"password"]];
    NSError *err;
    
    NSArray *objects = [context executeFetchRequest:rq error:&err];
    if (objects.count > 0) {
        
        if([[[objects objectAtIndex:0] objectForKey: @"password" ] isEqualToString: password.text]) {
            NSLog(@"Login Successful");
        
        //load new screen
            
            [self performSegueWithIdentifier:@"Main" sender:self];
         /*
            UIViewController *main = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
            [self.navigationController pushViewController:main animated:YES];
        */
        
        } else
            NSLog(@"FAILURE");
    }
    else
    {
        NSLog(@"fhasdjkhgjkahflnadklf");
    }
    
}
-(IBAction)pressLoad: (id)sender
{


}


@end