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
#import "TimePickerViewController.h"
@interface RoomPickerViewController :UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
    //NSArray *rooms;
    Room *selectedRoom;
    
}
@property (weak, nonatomic) IBOutlet UITableView *roomTableView;
@property (nonatomic, strong) NSArray *rooms;
@property (nonatomic, retain) Room *selectedRoom;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSArray *searResults;

@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;


-(void) populateArray;

@end
