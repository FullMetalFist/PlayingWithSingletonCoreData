//
//  UnitSearchTableViewCell.m
//  PlayingWithSingletonCoreData
//
//  Created by Michael Vilabrera on 5/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "UnitSearchTableViewCell.h"
#import "Units.h"

@interface UnitSearchTableViewCell()

@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *typeLabel;

@end

@implementation UnitSearchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForUnit:(Units *)unit
{
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [unit.name boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

- (void) configureCellForUnit:(Units *)unit
{
    self.nameLabel.text = unit.name;
    self.typeLabel.text =[NSString stringWithFormat:@"%hd", unit.type];
}

- (NSString *)stringFromNumericType:(Units *)unit
{
    
    return nil;
}

@end
