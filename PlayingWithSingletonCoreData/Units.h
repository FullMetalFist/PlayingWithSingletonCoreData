//
//  Units.h
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Units : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * attackType;
@property (nonatomic) BOOL airAttack;
@property (nonatomic) float cooldown;
@property (nonatomic, retain) NSString * range;

@end
