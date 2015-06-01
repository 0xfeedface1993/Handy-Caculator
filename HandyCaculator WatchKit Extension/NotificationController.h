//
//  NotificationController.h
//  HandyCaculator WatchKit Extension
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface NotificationController : WKUserNotificationInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;

@end
