//
//  ViewController.m
//  HandyCaculator
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import "ViewController.h"
static NSString *UICaculateResultFresh=@"UICaculateResultFresh";
static NSString *caculateResultKeyName=@"caculateResultKeyName";
static NSString *cacutaleResultDisplayKeyName=@"cacutaleResultDisplayKeyName";
//NSString *const AAPLAppConfigurationApplicationGroupsPrimary = @"group."HANDYCACULATOR_BUNDLE_PREFIX_STRING@".Lister.Documents";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self resetAllState];
    NSUserDefaults *userDefaults=[[NSUserDefaults alloc]
                                  initWithSuiteName:@"group.com.watch.switch"];
    [userDefaults setBool:NO
                   forKey:cacutaleResultDisplayKeyName];
    
    /*NSArray *numberArray=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *functionArray=@[@"+",@"-",@"*",@"/",@"=",@"C"];*/
    
    NSArray *titleArray=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"+",@"-",@"*",@"/",@"=",@"C"];

    ActionButtonType actionButtonType;
    
    for (NSString *string in titleArray) {
        if ([string intValue]||[string isEqualToString:@"0"]) {
            actionButtonType=ActionButtonTypeNumber;
            [self makeButton:actionButtonType withTitle:string inView:self.view];
        }else{
            actionButtonType=ActionButtonTypeCaculate;
            [self makeButton:actionButtonType withTitle:string inView:self.view];
        }
    }
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/6.5*1.5)];
   [label setTextAlignment:NSTextAlignmentRight];
   [label setFont:[UIFont systemFontOfSize:label.frame.size.height*0.68]];
    label.numberOfLines=1;
    label.adjustsFontSizeToFitWidth=YES;
    //label.text=@"1cgfh";
    label.backgroundColor=[UIColor grayColor];
    //label.textColor=[UIColor redColor];
   // NSLog(@"X:%f Y:%f Height:%f Width:%f",label.frame.origin.x,label.frame.origin.y, label.frame.size.height,label.frame.size.width);
    NSLog(@"%lu",sizeof(long double));
    _resultLabel=label;
    [self.view addSubview:label];
    
    
    
}
-(void)resetAllState{
    caculateArgumentState=CaculatorStateNoneArgument;
    caculateState=CaculatorStateNone;
    _stateChangeCount=0;
    referNumber_0=[[NSNumber alloc] initWithLongLong:0];
    arg1=referNumber_0;
    arg2=referNumber_0;
    arg3=referNumber_0;
    result=referNumber_0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sendResultToWatch{
    NSString *resultText=[NSString stringWithFormat:@"%d",[result intValue]];
    NSUserDefaults *userDefaults=[[NSUserDefaults alloc] initWithSuiteName:@"group.com.watch.switch"];
    
    [userDefaults setObject:resultText
                     forKey:caculateResultKeyName];
    [userDefaults setBool:YES
                   forKey:cacutaleResultDisplayKeyName];
    //[[NSNotificationCenter defaultCenter] postNotificationName:UICaculateResultFresh object:nil];
}
- (void)equal2:(id)sender {
    if (caculateArgumentState!=CaculatorStateEquToArgument) {
        [self doCaculate];
        [self displayResultOfCaculate];
        [self sendResultToWatch];
        arg1=result;
        result=referNumber_0;
        arg2=referNumber_0;
        caculateState=CaculatorStateNone;
        caculateArgumentState=CaculatorStateEquToArgument;
        //[self sendResultToWatch];
    }
    
}

- (void)clearButtonPress:(id)sender {
    [self resetAllState];
    [self displayResultOfCaculate];
}

-(void)selectNumberButton:(id)sender{
    
    
   [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.watch.switch"] setBool:NO forKey:cacutaleResultDisplayKeyName];
    UIButton *button=(UIButton *)sender;
    UIButton *buttonZero=[self getNumberButtonZero];
    long long oldValue=[arg1 longLongValue];
    long long newValue;
    
    
    
    if (buttonZero.enabled==NO) {
        buttonZero.enabled=YES;
    }
    
    if (CaculatorStateNoneArgument==caculateArgumentState) {
        
        long long argInt1=button.tag;
        long long argIntWeighting=[arg1 longLongValue]*10;
        NSNumber *number=[[NSNumber alloc] initWithLongLong:argInt1+argIntWeighting];
        
        arg1=number;
        //arg2=number;
        result=number;
        [self displayResultOfCaculate];
        //caculateState=CaculatorStateOneArgument;
    }else if(CaculatorStateOneArgument==caculateArgumentState){

        long long argInt2=button.tag;
        long long argIntWeighting=[arg2 longLongValue]*10;
        NSNumber *number=[[NSNumber alloc] initWithLongLong:argInt2+argIntWeighting];
        
        //arg1=arg2;
        arg2=number;
        result=number;
        [self displayResultOfCaculate];
    }else if(caculateArgumentState==CaculatorStateEquToArgument){
        long long argInt1=button.tag;
        //int argIntWeighting=[arg1 long long]*10;
        NSNumber *number=[[NSNumber alloc] initWithLongLong:argInt1];
        
        arg1=number;
        //arg2=number;
        result=number;
        caculateArgumentState=CaculatorStateNoneArgument;
        [self displayResultOfCaculate];
        
    }else{
        
    }
    NSLog(@"%u",MAX_TRAILER_SIZE);
    NSLog(@"arg1:%@ arg2:%@ result:%@ stateCount:%d",arg1,arg2,arg3,_stateChangeCount);
    //newValue=[arg1 longLongValue];
    //NSLog(@"old:%Lf new:%Lf",oldValue,newValue);
    //NSLog(@"%lu",sizeof(long long));
}
-(void)doCaculate{
    long long a=[arg1 longLongValue];
    long long b=[arg2 longLongValue];
    long long c=[result longLongValue];
    Arithmetic *arithmetic=[[Arithmetic alloc] init];
    
    switch (caculateState) {
        case CaculatorStateAddtion:
            c=[arithmetic add:a with:b];
            
            break;
            case CaculatorStateSubstruction:
            c=[arithmetic sub:a with:b];
            break;
            case CaculatorStateMutilper:
            c=[arithmetic mul:a with:b];
            break;
            case CaculatorStateDivider:
            c=[arithmetic div:a with:b];
            break;
           case CaculatorStateNone:
            //c=a;
            break;
        default:
            break;
    }
    
    NSNumber *number=[[NSNumber alloc] initWithLongLong:c];
    result=number;
    NSLog(@"%Lf",c);
}
-(void)displayResultOfCaculate{
    self.resultLabel.text=[NSString stringWithFormat:@"%lld",[result longLongValue]];
}
-(void)selectCaculateButton:(id)sender{
    [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.watch.switch"] setBool:NO forKey:cacutaleResultDisplayKeyName];
    UIButton *button=sender;
    NSString *buttonTitleText=button.titleLabel.text;
     NSLog(@"%@",buttonTitleText);
    
    _stateChangeCount=CaculatorStateEquToArgument==caculateArgumentState? 0:_stateChangeCount;
    
    
    if ([buttonTitleText isEqualToString:@"+"]) {
        if (_stateChangeCount>1) {
            caculateState=CaculatorStateAddtion;
            [self continueCaculateCommeProcess];
            //[self sendResultToWatch];
        }
        caculateState=CaculatorStateAddtion;
        caculateArgumentState=CaculatorStateOneArgument;
        _stateChangeCount+=1;

    }
    if ([buttonTitleText isEqualToString:@"-"]) {
        if (_stateChangeCount>1) {
            caculateState=CaculatorStateSubstruction;
            [self continueCaculateCommeProcess];
            //[self sendResultToWatch];
        }
        caculateState=CaculatorStateSubstruction;
        caculateArgumentState=CaculatorStateOneArgument;
        _stateChangeCount+=1;
    }
    if ([buttonTitleText isEqualToString:@"*"]) {
        if (_stateChangeCount>1) {
            caculateState=CaculatorStateMutilper;
            [self continueCaculateCommeProcess];
            //[self sendResultToWatch];
        }
        caculateState=CaculatorStateMutilper;
        caculateArgumentState=CaculatorStateOneArgument;
        _stateChangeCount+=1;
    }
    if ([buttonTitleText isEqualToString:@"/"]) {
        if (_stateChangeCount>1) {
            caculateState=CaculatorStateSubstruction;
            [self continueCaculateCommeProcess];
            //[self sendResultToWatch];
        }
        [self getNumberButtonZero].enabled=NO;
        caculateState=CaculatorStateDivider;
        caculateArgumentState=CaculatorStateOneArgument;
        _stateChangeCount+=1;
    }
    //NSLog(@"arg1:%@ arg2:%@ result:%@ ",arg1,arg2,arg3);
}
-(UIButton *)getNumberButtonZero{
    for (UIButton *button in self.NumberButtons) {
        if (button.tag==0) {
            return button;
        }
    }
    return nil;
}

-(void)continueCaculateCommeProcess{
    switch (caculateState) {
        case CaculatorStateAddtion:
            [self doCaculate];
            break;
        case CaculatorStateSubstruction:
            [self doCaculate];
            break;
        case CaculatorStateMutilper:
            [self doCaculate];
            //arg2=[[NSNumber alloc] initWithLongLong:1];
            break;

        case CaculatorStateDivider:
            [self doCaculate];
            //arg2=[[NSNumber alloc] initWithLongLong:1];
            break;

        default:
            break;
    }
    
    [self displayResultOfCaculate];
    [self sendResultToWatch];
    arg1=result;
    result=referNumber_0;
    arg2=referNumber_0;
}

#pragma mark - Make Button Methods

-(void)makeButton:(ActionButtonType)buttonType withTitle:(NSString *)title inView:(UIView *)view{
    CGFloat buttonWidth=view.frame.size.width;
    CGFloat buttonHeight=view.frame.size.height;
    
    CGPoint oringinPoint=[self locateOriginByTitle:title buttonType:buttonType size:view.frame.size];
    
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addButton setFrame:CGRectMake(oringinPoint.x,oringinPoint.y,buttonWidth/4, [title isEqualToString:@"+"]? buttonHeight/6.5*5:buttonHeight/6.5)];
    [addButton setBackgroundColor:[UIColor blackColor]];
    UIImage *image=[self imageWithColor:[UIColor redColor] rect:addButton.frame];
    [addButton setBackgroundImage:image forState:UIControlStateHighlighted];
    [addButton setTitle:title forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    //addButton.titleLabel.font=[UIFont systemFontOfSize:20];
    //addButton.titleLabel.numberOfLines=1;
    addButton.titleLabel.frame=addButton.frame;
    addButton.titleLabel.adjustsFontSizeToFitWidth=YES;
    [addButton setShowsTouchWhenHighlighted:YES];
    [addButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    
    [addButton addTarget:self action:[self selectorForButton:title buttontype:buttonType] forControlEvents:UIControlEventTouchUpInside];
    
    if (buttonType==ActionButtonTypeNumber) {
        [addButton setTag:[title intValue]];
        [_arthmeticsButton addObject:addButton];
    }
    if (buttonType==ActionButtonTypeCaculate) {
        [_NumberButtons addObject:addButton];
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
    float number=[title intValue];
    int passCode=(int)number%3;
    float outCode=number/3;
    
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
