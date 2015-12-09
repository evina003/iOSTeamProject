//
//  Room.h
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * cap;
@property (nonatomic, retain) NSString * roomNum;
@property (nonatomic, retain) Reservation *roomToRes;

@end
