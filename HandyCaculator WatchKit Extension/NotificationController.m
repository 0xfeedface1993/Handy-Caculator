//
//  NotificationController.m
//  HandyCaculator WatchKit Extension
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import "NotificationController.h"


@interface NotificationController()

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

NSString *apsKeyString=@"aps";
NSString *titleKeyString=@"title";

/*
 - (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic noti fication inteface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
        completionHandler(WKUserNotificationInterfaceTypeCustom);
}
 */


- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification inteface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    /*
    NSDictionary *apsDictionary=[remoteNotification objectForKey:apsKeyString];
    NSLog(@"%@",apsDictionary);
    NSDictionary *alertDic=[apsDictionary objectForKey:@"alert"];
    NSString *titleString=[alertDic objectForKey:titleKeyString];
   
    [self.titleLabel setText:titleString];
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
     */
}


@end



