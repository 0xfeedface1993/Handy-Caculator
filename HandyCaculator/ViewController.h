//
//  ViewController.h
//  HandyCaculator
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MathController.h"
#import "DataInANDOut.h"

@class DataInANDOut;
typedef NS_ENUM(NSInteger, CaculateArgumentState){
    CaculatorStateNoneArgument=1,
    CaculatorStateOneArgument,
    CaculatorStateTowArgument,
    CaculatorStateEquToArgument
};

typedef NS_ENUM(NSInteger, CaculateState){
    CaculatorStateAddtion=1,
    CaculatorStateDivider,
    CaculatorStateMutilper,
    CaculatorStateSubstruction,
    //CaculatorStateEquTo,
    CaculatorStateNone
};

typedef  NS_ENUM(NSInteger,ActionButtonType){
    ActionButtonTypeNumber=0,
    /*ActionButtonTypeNumber_1,
     ActionButtonTypeNumber_2,
     ActionButtonTypeNumber_3,
     ActionButtonTypeNumber_4,
     ActionButtonTypeNumber_5,
     ActionButtonTypeNumber_6,
     ActionButtonTypeNumber_7,
     ActionButtonTypeNumber_8,
     ActionButtonTypeNumber_9,*/
    ActionButtonTypeCaculate
    /*
     ActionButtonTypeCaculate_sub,
     ActionButtonTypeCaculate_mul,
     ActionButtonTypeCaculate_div
     */
};

@interface ViewController : UIViewController{
    NSNumber *arg1;
    NSNumber *arg2;
    NSNumber *result;
    NSNumber *arg3;
    NSNumber *referNumber_0;
    int argCount;
    CaculateArgumentState caculateArgumentState;
    CaculateState caculateState;
}
@property (strong, nonatomic)  UILabel *resultLabel;
@property (strong, nonatomic)  NSMutableArray *NumberButtons;
@property (strong, nonatomic) NSMutableArray *arthmeticsButton;
@property (assign) int stateChangeCount;

-(void)selectNumberButton:(id)sender;
-(void)selectCaculateButton:(id)sender;
- (void)equal2:(id)sender;
- (void)clearButtonPress:(id)sender;

@end

