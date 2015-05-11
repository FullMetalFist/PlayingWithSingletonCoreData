//
//  CoreDataStack.h
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/11/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype) defaultStack;

- (void) saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
