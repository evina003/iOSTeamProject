//
//  ReasonPickerViewController.h
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Room.h"
#import "TimePickerViewController.h"

@interface ReasonPickerViewController : UIViewController<UIAlertViewDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray* reasons;
    Reservation *resChoice;
}
@property (weak, nonatomic) IBOutlet UIPickerView *reasonPicker;
@property (nonatomic, retain) Reservation *resChoice;
@property (weak, nonatomic) IBOutlet UIButton *submit;
- (IBAction)submitReservation:(id)sender;
@end
