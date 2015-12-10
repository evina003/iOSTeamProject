//
//  Reservation.h
//  RoomRes
//
//  Created by emmanuel vinas on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Reservation : NSManagedObject

@property (nonatomic, retain) NSString * rID;
@property (nonatomic, retain) NSString * roomNum;
@property (nonatomic, retain) NSString * taken;
@property (nonatomic, retain) NSString * time;
@property (nonatomic,retain)  NSString * reason;

@end
