//
//  UnitSearchTableViewCell.h
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Units;

@interface UnitSearchTableViewCell : UITableViewCell

+ (CGFloat) heightForUnit:(Units *) unit;
- (void) configureCellForUnit:(Units *) unit;

@end
