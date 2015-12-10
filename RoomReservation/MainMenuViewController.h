//
//  MainMenuViewController.h
//  RoomRes
//
//  Created by giselle pacheco on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Users.h"
#import "Reservation.h"

@interface MainMenuViewController : UIViewController <UIAlertViewDelegate>
{
    NSManagedObjectContext *context;
    NSArray *reasons;
}
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UILabel *resInfo;
@property (weak, nonatomic) IBOutlet UILabel *resID;
@property (weak, nonatomic) IBOutlet UILabel *resTime;
@property (weak, nonatomic) IBOutlet UILabel *resRoom;
@property (weak, nonatomic) Reservation* temp;

- (IBAction)pressCancel:(id)sender;

@end

