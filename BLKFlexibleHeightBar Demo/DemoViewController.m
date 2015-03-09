//
//  DemoViewController.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Bryan Keller on 2/6/15.
//  Copyright (c) 2015 Bryan Keller. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@property (weak, nonatomic) IBOutlet UIButton *squareCashButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;

@end

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.squareCashButton.layer.borderWidth = 2.0;
    self.squareCashButton.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    
    self.facebookButton.layer.borderWidth = 2.0;
    self.facebookButton.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
