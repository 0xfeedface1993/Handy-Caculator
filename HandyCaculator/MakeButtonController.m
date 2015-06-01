//
//  MakeButtonController.m
//  HandyCaculator
//
//  Created by virus1993 on 15/3/5.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import "MakeButtonController.h"

@implementation MakeButtonController

-(void)makeButton:(ActionButtonType)buttonType withTitle:(NSString *)title origin:(CGPoint)origin inView:(UIView *)view{
    CGFloat buttonWidth=view.frame.size.width;
    CGFloat buttonHeight=view.frame.size.height;
    //CGFloat buttonOrigin_x=origin.x;
    //CGFloat buttonOrigin_y=origin.y;
  /* 
   NSArray *numberArray=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *functionArray=@[@"+",@"-",@"*",@"/",@"=",@"C"];
    NSArray *titleArray=@[numberArray,functionArray];
    
    for (NSArray *array in title) {
        
    }
   ActionButtonType actionButtonType=ActionButtonTypeCaculate;
    
    for (NSString *string in functionArray) {
        if ([string isEqualToString:title]) {
            actionButtonType=ActionButtonTypeNumber;
            break;
        }
    }*/
    
    
    CGPoint oringinPoint=[self locateOriginByTitle:title buttonType:buttonType size:view.frame.size];
    
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addButton setFrame:CGRectMake(oringinPoint.x,oringinPoint.y,buttonWidth/5, [title isEqualToString:@"+"]? buttonHeight/6.5*5:buttonHeight/6.5)];
    [addButton setBackgroundColor:[UIColor blackColor]];
    UIImage *image=[self imageWithColor:[UIColor redColor] rect:addButton.frame];
    [addButton setBackgroundImage:image forState:UIControlStateHighlighted];
    [addButton setTitle:@"yes" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    addButton.titleLabel.font=[UIFont systemFontOfSize:20];
    [addButton setShowsTouchWhenHighlighted:YES];
     [addButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    
    [addButton addTarget:self action:[self selectorForButton:title buttontype:buttonType] forControlEvents:UIControlEventTouchUpInside];
    
    if (buttonType==ActionButtonTypeNumber) {
        [addButton setTag:[title intValue]];
    }
    if (buttonType==ActionButtonTypeCaculate) {
        
    }
    
    [view addSubview:addButton];
}

-(SEL)selectorForButton:(NSString *)buttonTitle buttontype:(ActionButtonType)buttonType{
    return [buttonTitle isEqualToString:@"C"]? @selector(clearButtonPress:):[buttonTitle isEqualToString:@"="]? @selector(equal2:):buttonType==ActionButtonTypeCaculate? @selector(selectCaculateButton:):@selector(selectNumberButton:);
}

-(UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect{
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

-(CGPoint)locateOriginByTitle:(NSString *)title buttonType:(ActionButtonType)buttonType size:(CGSize)size{

    float eqalWidth=size.width/4;
    float eqalHeight=size.height/6.5;
    CGPoint realPoint;
    int number=[title intValue];
    int passCode=number%3;
    int outCode=number/3;
    
    switch (buttonType) {
        case ActionButtonTypeNumber:
            if (number) {
                switch (passCode) {
                    case 0:
                        realPoint.x=eqalWidth*2;
                        break;
                    case 1:
                        realPoint.x=0;
                        break;
                    case 2:
                        realPoint.x=eqalWidth;
                        break;
                    default:
                        break;
                }
                if (outCode<=1) {
                    realPoint.y=eqalHeight*4.5;
                }else if (outCode<=2){
                    realPoint.y=eqalHeight*3.5;
                }else if (outCode<=3){
                    realPoint.y=eqalHeight*2.5;
                }

            }else{
                realPoint=CGPointMake(eqalWidth*1, eqalHeight*5.5);
            }
            break;
        case ActionButtonTypeCaculate:
            if ([title isEqualToString:@"C"]||[title isEqualToString:@"="]){            //[title isEqualToString:@"/"]||[title isEqualToString:@"-"]||
                realPoint.y=eqalHeight*5.5;                                             //[title isEqualToString:@"*"]||[title isEqualToString:@"+"]) {
            }else{                                                                      //if ([title isEqualToString:@"C"]||[title isEqualToString:@"="]) {
                realPoint.y=eqalHeight*1.5;
            }

            if ([title isEqualToString:@"/"]||[title isEqualToString:@"C"]) {
                realPoint.x=0;
            }else if([title isEqualToString:@"-"]){
                realPoint.x=eqalWidth;
            }else if([title isEqualToString:@"+"]){
                realPoint.x=eqalWidth*3;
            }else{
                realPoint.x=eqalWidth*2;
            }
            break;
        default:
            break;
    }
    return realPoint;
}

@end
