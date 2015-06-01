//
//  DataInANDOut.h
//  HandyCaculator
//
//  Created by virus1993 on 15/2/15.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataInANDOut : NSObject

-(void)saveWithFetchedContext:(NSManagedObjectContext *)context
                   showNumber:(NSNumber*)showNumber
                presentNumber:(NSNumber*)presentNmuber
               previousNumber:(NSNumber*)previousNumbr;

-(NSArray *)readNumberFromResultsController:(NSFetchedResultsController *)fetchedResultsController;

@end
