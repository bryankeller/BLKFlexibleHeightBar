//
//  FacebookStyleInterfaceBuilderBottomBar.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Denis Zamataev on 15/01/16.
//  Copyright © 2016 Bryan Keller. All rights reserved.
//

#import "FacebookStyleInterfaceBuilderBottomBar.h"

@interface FacebookStyleInterfaceBuilderBottomBar ()

@property (nonatomic) IBOutlet UIButton *firstButton;
@property (nonatomic) IBOutlet UIButton *secondButton;

@end

@implementation FacebookStyleInterfaceBuilderBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self configureBar];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configureBar];
}

- (void)configureBar
{
    // Configure bar appearence
    self.maximumBarHeight = 44.0;
    self.minimumBarHeight = 0.0;
    
    // Setup layout attributes
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialFirstButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
    initialFirstButtonLayoutAttributes.alpha = 1.0;
    initialFirstButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.firstButton addLayoutAttributes:initialFirstButtonLayoutAttributes forProgress:0.0];
    [self.firstButton addLayoutAttributes:initialFirstButtonLayoutAttributes forProgress:0.3];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalFirstButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialFirstButtonLayoutAttributes];
    finalFirstButtonLayoutAttributes.alpha = 0.0;
    finalFirstButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.firstButton addLayoutAttributes:finalFirstButtonLayoutAttributes forProgress:0.9];
    [self.firstButton addLayoutAttributes:finalFirstButtonLayoutAttributes forProgress:1.0];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialSecondButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
    initialSecondButtonLayoutAttributes.alpha = 1.0;
    initialSecondButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.secondButton addLayoutAttributes:initialSecondButtonLayoutAttributes forProgress:0.0];
    [self.secondButton addLayoutAttributes:initialSecondButtonLayoutAttributes forProgress:0.3];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalSecondButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialSecondButtonLayoutAttributes];
    finalSecondButtonLayoutAttributes.alpha = 0.0;
    finalSecondButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.secondButton addLayoutAttributes:finalSecondButtonLayoutAttributes forProgress:0.9];
    [self.secondButton addLayoutAttributes:finalSecondButtonLayoutAttributes forProgress:1.0];
}

@end
