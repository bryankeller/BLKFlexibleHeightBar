//
//  InterfaceBuilderViewController.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Denis Zamataev on 14/01/16.
//  Copyright © 2016 Bryan Keller. All rights reserved.
//

#import "InterfaceBuilderViewController.h"
#import "InterfaceBuilderBar.h"
#import "InterfaceBuilderBehaviorDefiner.h"
#import "BLKDelegateSplitter.h"

@interface InterfaceBuilderViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet InterfaceBuilderBar *topBar;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;

@property (nonatomic) BLKDelegateSplitter *delegateSplitter;
@end

@implementation InterfaceBuilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNeedsStatusBarAppearanceUpdate];

    // Setup the table view
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.contentInset = UIEdgeInsetsMake(self.topBar.maximumBarHeight, 0.0, 0.0, 0.0);

    InterfaceBuilderBehaviorDefiner *behaviorDefiner = [[InterfaceBuilderBehaviorDefiner alloc] init];
    [behaviorDefiner addSnappingPositionProgress:0.0 forProgressRangeStart:0.0 end:0.5];
    [behaviorDefiner addSnappingPositionProgress:1.0 forProgressRangeStart:0.5 end:1.0];
    behaviorDefiner.snappingEnabled = YES;
    self.topBar.behaviorDefiner = behaviorDefiner;
    
    // Configure a separate UITableViewDelegate and UIScrollViewDelegate (optional)
    self.delegateSplitter = [[BLKDelegateSplitter alloc] initWithFirstDelegate:behaviorDefiner secondDelegate:self];
    self.tableView.delegate = (id<UITableViewDelegate>)self.delegateSplitter;
    
    // Setup layout attributes
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialCloseButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
    initialCloseButtonLayoutAttributes.alpha = 1.0;
    initialCloseButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.closeButton addLayoutAttributes:initialCloseButtonLayoutAttributes forProgress:0.0];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalCloseButtonLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialCloseButtonLayoutAttributes];
    finalCloseButtonLayoutAttributes.alpha = 0.0;
    finalCloseButtonLayoutAttributes.shouldAffectPositioning = NO;
    [self.closeButton addLayoutAttributes:finalCloseButtonLayoutAttributes forProgress:1.0];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialTextFieldLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
    initialTextFieldLayoutAttributes.alpha = 1.0;
    initialTextFieldLayoutAttributes.shouldAffectPositioning = NO;
    [self.textField addLayoutAttributes:initialTextFieldLayoutAttributes forProgress:0.0];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalTextFieldLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialTextFieldLayoutAttributes];
    finalTextFieldLayoutAttributes.alpha = 0.0;
    finalTextFieldLayoutAttributes.shouldAffectPositioning = NO;
    [self.textField addLayoutAttributes:finalTextFieldLayoutAttributes forProgress:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)closeViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


# pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    return cell;
}

@end
