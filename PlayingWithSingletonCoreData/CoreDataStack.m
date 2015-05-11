//
//  CoreDataStack.m
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/11/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack

#pragma mark -- Core Data Stack
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype) defaultStack
{
    static CoreDataStack *defaultStack;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultStack = [[self alloc] init];
    });
    return defaultStack;
}

- (NSURL *) applicationDocumentsDirectory
{
    // the directory the application uses to store the Core Data store file.
    // This code uses a directory named "com.GivingTree.PlayingWithSingletonCoreData"
    // in the application's documents directory
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    // the managed object model for the application. It is a fatal error for the application  not to be able to find and load its model.
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"PlayingWithSingletonCoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    // the persistent store coordinator for the application. this implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    // create the coordinator and the store
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"PlayingWithSingletonCoreData.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // report any error
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // replace this with code to handle the error appropriately
        // abort() causes the application to generate a crash log and terminate.
        // This is not production quality code.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *) managedObjectContext
{
    // returns the managed object context for the application (which is already
    // bound to the persistent store coordinator for the application.)
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark -- Core Data Saving Support
- (void) saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // replace this implementation with code to handle the error appropriately
            // abort() causes the application to generate a crash log and terminate
            // this is not production quality code.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
