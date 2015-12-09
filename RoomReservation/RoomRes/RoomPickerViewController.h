//
//  RoomPickerViewController.h
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Room.h"
@interface RoomPickerViewController :UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *rooms;
    Room *selectedRoom;
}
@property (weak, nonatomic) IBOutlet UITableView *roomTableView;
@property (nonatomic, retain) NSArray *rooms;
@property (nonatomic, retain) Room *selectedRoom;
-(void) populateArray;
-(void)enableSearch;
@end
