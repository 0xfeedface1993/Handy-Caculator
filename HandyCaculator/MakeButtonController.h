//
//  MakeButtonController.h
//  HandyCaculator
//
//  Created by virus1993 on 15/3/5.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UIView,UIButton,UIImage;

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

@interface MakeButtonController : NSObject
-(void)makeButton:(ActionButtonType)buttonType withTitle:(NSString *)title inView:(UIView *)view;
@end
