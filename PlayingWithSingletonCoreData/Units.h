//
//  Units.h
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/11/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


NS_ENUM(int16_t, UnitType){
    UnitTypeHuman = 0,
    UnitTypeOrc = 1,
    UnitTypeUndead = 2,
    UnitTypeNightElf = 3
};

NS_ENUM(int16_t, UnitPrimaryAttribute){
    UnitPrimaryAttributeStrength = 0,
    UnitPrimaryAttributeIntelligence = 1,
    UnitPrimaryAttributeSpeed = 2
};

@interface Units : NSManagedObject

@property (nonatomic, retain) NSNumber * airAttack;
@property (nonatomic, retain) NSString * attackType;
@property (nonatomic, retain) NSNumber * cooldown;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * range;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * primaryAttribute;

@end
