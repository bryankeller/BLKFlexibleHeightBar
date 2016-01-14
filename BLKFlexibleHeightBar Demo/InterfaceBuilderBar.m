//
//  InterfaceBuilderBar.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Denis Zamataev on 14/01/16.
//  Copyright © 2016 Bryan Keller. All rights reserved.
//

#import "InterfaceBuilderBar.h"

@implementation InterfaceBuilderBar

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

    
}
@end
