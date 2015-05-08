//
//  Units.h
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/8/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, UnitType) {
    UnitTypeHuman = 0,
    UnitTypeOrc = 1,
    UnitTypeUndead = 2,
    UnitTypeNightElf = 3
};

@interface Units : NSManagedObject

@property (nonatomic) BOOL airAttack;
@property (nonatomic, retain) NSString * attackType;
@property (nonatomic) float cooldown;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * range;
@property (nonatomic) int16_t type;

@end
