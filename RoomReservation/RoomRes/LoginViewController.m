//
//  ViewController.m
//  RoomRes
//
//  Created by giselle pacheco on 12/6/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize username, password, passlabel, userlabel;


/*
 This method loads coreData with:
 two significant users
 Rooms
 and times
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    if(![appDelegate coreDataHasEntriesForEntityName:@"Users"])
    {
        Users *giselle1 = [NSEntityDescription insertNewObjectForEntityForName: @"Users" inManagedObjectContext: context];
        Users *a = [NSEntityDescription insertNewObjectForEntityForName: @"Users" inManagedObjectContext: context];
        Users *manny = [NSEntityDescription insertNewObjectForEntityForName: @"Users" inManagedObjectContext: context];
    
        giselle1.username  = @"gpach002";
        giselle1.password = @"iLoveJessicaJones";
        giselle1.touchID =[NSNumber numberWithInt: -1];
   
        a.username  = @"a";
        a.password = @"a";
        a.touchID = [NSNumber numberWithInt: -1];

        manny.username = @"evinas003" ;
        manny.password = @"iLoveSM";
        manny.touchID = [NSNumber numberWithInt: -1];

        if(![appDelegate coreDataHasEntriesForEntityName:@"Room"])
        {
            NSArray *roomNames = [[NSArray alloc]initWithObjects:@"536A",@"536B",@"537A",@"537B",@"595A",@"625A",@"693",@"695A",@"721",@"727",@"791",@"539A",@"539B",@"799",nil];
       
            NSArray *resTimes = [[NSArray alloc] initWithObjects:@"8AM to 10:59AM", @"11AM to 1:59PM",@"2PM to 4:59PM",@"5PM to 7:59PM",@"8PM to 10:59PM",@"11PM to 12:30AM",nil];
        
            for(int i = 0 ; i < roomNames.count; i++)
            {
                Room *x =  [NSEntityDescription insertNewObjectForEntityForName: @"Room" inManagedObjectContext: context];
        
                x.roomNum = [roomNames objectAtIndex:i];
                x.cap = [NSNumber numberWithInt: (i != 0)? 2 : i * 2];
                for (int j = 0; j < resTimes.count; j++) {
            
                    Reservation *reserv= [NSEntityDescription insertNewObjectForEntityForName: @"Reservation" inManagedObjectContext: context];
            
                    reserv.roomNum = x.roomNum;
                    reserv.taken = @"NO";
                    reserv.rID = @"0";
                    reserv.time = [resTimes objectAtIndex:j];
                }
            }
        }
    
        NSError *err = nil;
    
        [context save:&err];
        
        UIApplication *app = [UIApplication sharedApplication];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillResignActive:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:app];

    }
}
/*
-(void) viewWillAppear:(BOOL)animated
{
 
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    [rq setEntity:desc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"username == %@", appDelegate.current.username];
    [rq setPredicate:pred];
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
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == username) {
        [username resignFirstResponder];
    }
    
    if (textField == password) {
        [password resignFirstResponder];
    }
    return TRUE;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [username resignFirstResponder];
    [password resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
 This method makes sure that the password and username are correct for a user
 
*/

-(IBAction)pressLogin: (id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *rq = [[NSFetchRequest alloc] init];
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    [rq setEntity:desc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"username == %@", username.text];
    [rq setPredicate:pred];
    NSError *err;
    
    NSArray *objects = [context executeFetchRequest:rq error:&err];
    if (objects.count > 0) {
        Users *currUser = [objects objectAtIndex:0];
        if([currUser.password isEqualToString: password.text]) {
            appDelegate.current = currUser;
            [self performSegueWithIdentifier:@"Main" sender:self];
            /*NSString *filePath = [self dataFilePath];
            if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
                NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];*/
        } else{
            UIAlertView *alert;
            alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login" message:@"Wrong Username or Password, Please Try Again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            password.text = @"";
        }
    } else{
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login" message:@"Wrong Username or Password, Please Try Again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        username.text = @"";
        password.text = @"";
        }
    
    }


- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}



- (void)applicationWillResignActive:(NSNotification *)notification {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

    [array addObject: appDelegate.current.username];
    [array writeToFile:[self dataFilePath] atomically:YES];
}

@end
