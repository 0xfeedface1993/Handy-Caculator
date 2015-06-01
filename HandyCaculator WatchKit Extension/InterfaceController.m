//
//  InterfaceController.m
//  HandyCaculator WatchKit Extension
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import "InterfaceController.h"
static NSString *UICaculateResultFresh=@"UICaculateResultFresh";
static NSString *caculateResultKeyName=@"caculateResultKeyName";
static NSString *cacutaleResultDisplayKeyName=@"cacutaleResultDisplayKeyName";
@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self.caculateResultLebel setText:@"-----"];
    [self.resultComingLabel setText:@"Do You Job"];
    /*NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(refreshLabelText)
                               name:UICaculateResultFresh
                             object:nil];*/
    [self performSelector:@selector(refreshLabelText) withObject:nil afterDelay:0.5];
    
}
-(void)refreshLabelText{
    NSUserDefaults *userDefaults=[[NSUserDefaults alloc] initWithSuiteName:@"group.com.watch.switch"];
    NSString *result=[userDefaults valueForKey:caculateResultKeyName];
    BOOL flag=[userDefaults boolForKey:cacutaleResultDisplayKeyName];
    NSLog(@"%hhd",flag);
     NSLog(@"%@",result);
    if (!flag) {
        [self performSelector:@selector(refreshLabelText) withObject:nil afterDelay:0.5];
        return;
    }
    [self.caculateResultLebel setText:result];
    [self.resultComingLabel setText:@"You Result"];
    [self performSelector:@selector(refreshLabelText) withObject:nil afterDelay:0.5];
}
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification{
    
}
@end



