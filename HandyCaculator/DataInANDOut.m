//
//  DataInANDOut.m
//  HandyCaculator
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import "DataInANDOut.h"

static NSString *DIOShowNuber=@"showNumber";
static NSString *DIOPresentNumber=@"presentNumber";
static NSString *DIOPreviousNumber=@"previousNumber";

@implementation DataInANDOut

-(void)saveWithFetchedContext:(NSFetchedResultsController *)fetchedResultsController
                   showNumber:(NSNumber*)showNumber
                presentNumber:(NSNumber*)presentNmuber
               previousNumber:(NSNumber*)previousNumbr{
    
    NSManagedObjectContext *context=[fetchedResultsController managedObjectContext];
    NSEntityDescription *entity=[[fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject=[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    [newManagedObject setValue:showNumber forKey:DIOShowNuber];
    [newManagedObject setValue:presentNmuber forKey:DIOPresentNumber];
    [newManagedObject setValue:previousNumbr forKey:DIOPreviousNumber];
    
    NSError *error=nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@,%@",error,[error userInfo]);
        abort();
    }
}

-(NSArray *)readNumberFromResultsController:(NSFetchedResultsController *)fetchedResultsController{
    
    NSManagedObjectContext *context=[fetchedResultsController managedObjectContext];
    NSEntityDescription *entity=[[fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject=[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    //[newManagedObject setValue:showNumber forKey:DIOShowNuber];
    //[newManagedObject setValue:presentNmuber forKey:DIOPresentNumber];
    //[newManagedObject setValue:previousNumbr forKey:DIOPreviousNumber];
    
    NSNumber *showNumber=[newManagedObject valueForKey:DIOShowNuber];
    NSNumber *presentNumber=[newManagedObject valueForKey:DIOPresentNumber];
    NSNumber *previousNumber=[newManagedObject valueForKey:DIOPreviousNumber];
    
    NSArray *array=[[NSArray alloc] initWithObjects:showNumber,presentNumber,previousNumber, nil];
    
    return array;
}
@end
