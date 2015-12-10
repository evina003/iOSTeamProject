//
//  TimePickerViewController.h
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Room.h"
#import "Reservation.h"
#import "ReasonPickerViewController.h"
@interface TimePickerViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSString *rNum;
    NSArray *availTimes;
    Reservation *selectedRes;
}

@property(nonatomic, retain)NSString *rNum;
@property(nonatomic, retain)NSArray *availTimes;
@property(nonatomic, retain)Reservation *selectedRes;

//show times available for room number chosen.
- (void)populateData;

@end
