//
//  ViewController.h
//  RoomRes
//
//  Created by giselle pacheco on 12/6/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSManagedObjectContext *context;
}

@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong) IBOutlet UITextField *password;

@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) IBOutlet UIButton *load;

@property (nonatomic, strong) IBOutlet UILabel *userlabel;
@property (nonatomic, strong) IBOutlet UILabel *passlabel;

-(IBAction)pressLogin: (id)sender;

@end

//moe'z express'