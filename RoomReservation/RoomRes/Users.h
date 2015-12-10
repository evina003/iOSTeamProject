//
//  Users.h
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * rID;
@property (nonatomic, retain) NSNumber * touchID;
@property (nonatomic, retain) NSString * username;
@end
