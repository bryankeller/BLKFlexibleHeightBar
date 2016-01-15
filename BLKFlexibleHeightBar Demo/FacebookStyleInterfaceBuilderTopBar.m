//
//  FacebookStyleInterfaceBuilderTopBar.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Denis Zamataev on 14/01/16.
//  Copyright © 2016 Bryan Keller. All rights reserved.
//

#import "FacebookStyleInterfaceBuilderTopBar.h"

@interface FacebookStyleInterfaceBuilderTopBar ()

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation FacebookStyleInterfaceBuilderTopBar

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
    self.maximumBarHeight = 64.0;
    self.minimumBarHeight = 22.0;

    // Setup layout attributes
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialCloseButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
    initialCloseButtonLayoutAttributes.alpha = 1.0;
    initialCloseButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.closeButton addLayoutAttributes:initialCloseButtonLayoutAttributes forProgress:0.0];
    [self.closeButton addLayoutAttributes:initialCloseButtonLayoutAttributes forProgress:0.3];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalCloseButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialCloseButtonLayoutAttributes];
    finalCloseButtonLayoutAttributes.alpha = 0.0;
    finalCloseButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.closeButton addLayoutAttributes:finalCloseButtonLayoutAttributes forProgress:0.9];
    [self.closeButton addLayoutAttributes:finalCloseButtonLayoutAttributes forProgress:1.0];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialTextFieldLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
    initialTextFieldLayoutAttributes.alpha = 1.0;
    initialTextFieldLayoutAttributes.shouldAffectPositioning = NO;
    [self.textField addLayoutAttributes:initialTextFieldLayoutAttributes forProgress:0.0];
    [self.textField addLayoutAttributes:initialTextFieldLayoutAttributes forProgress:0.3];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalTextFieldLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialTextFieldLayoutAttributes];
    finalTextFieldLayoutAttributes.alpha = 0.0;
    finalTextFieldLayoutAttributes.shouldAffectPositioning = NO;
    [self.textField addLayoutAttributes:finalTextFieldLayoutAttributes forProgress:0.9];
    [self.textField addLayoutAttributes:finalTextFieldLayoutAttributes forProgress:1.0];
}
@end
