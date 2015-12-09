//
//  MainMenuViewController.h
//  RoomRes
//
//  Created by giselle pacheco on 12/9/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController <UIAlertViewDelegate>
{
    NSManagedObjectContext *context;
}
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UILabel *resInfo;

- (IBAction)pressCancel:(id)sender;

@end

