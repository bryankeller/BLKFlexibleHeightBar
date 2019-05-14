//
//  FacebookStyleInterfaceBuilderViewController.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Denis Zamataev on 14/01/16.
//  Copyright © 2016 Bryan Keller. All rights reserved.
//

#import "FacebookStyleInterfaceBuilderViewController.h"
#import "FacebookStyleInterfaceBuilderTopBar.h"
#import "FacebookStyleInterfaceBuilderBottomBar.h"
#import "FacebookStyleBarBehaviorDefiner.h"
#import "BLKDelegateSplitter.h"

@interface FacebookStyleInterfaceBuilderViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet FacebookStyleInterfaceBuilderTopBar *topBar;
@property (strong, nonatomic) IBOutlet FacebookStyleInterfaceBuilderBottomBar *bottomBar;

@property (nonatomic) BLKDelegateSplitter *topBarDelegateSplitter;
@property (nonatomic) BLKDelegateSplitter *bottomBarDelegateSplitter;
@end

@implementation FacebookStyleInterfaceBuilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNeedsStatusBarAppearanceUpdate];

    // Setup the table view
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.contentInset = UIEdgeInsetsMake(self.topBar.maximumBarHeight, 0.0, 0.0, 0.0);

    FacebookStyleBarBehaviorDefiner *topBarBehaviorDefiner = [[FacebookStyleBarBehaviorDefiner alloc] init];
    [topBarBehaviorDefiner addSnappingPositionProgress:0.0 forProgressRangeStart:0.0 end:0.5];
    [topBarBehaviorDefiner addSnappingPositionProgress:1.0 forProgressRangeStart:0.5 end:1.0];
    topBarBehaviorDefiner.snappingEnabled = YES;
    topBarBehaviorDefiner.elasticMaximumHeightAtTop = NO;
    self.topBar.behaviorDefiner = topBarBehaviorDefiner;
    
    FacebookStyleBarBehaviorDefiner *bottomBarBehaviorDefiner = [[FacebookStyleBarBehaviorDefiner alloc] init];
    [bottomBarBehaviorDefiner addSnappingPositionProgress:0.0 forProgressRangeStart:0.0 end:0.5];
    [bottomBarBehaviorDefiner addSnappingPositionProgress:1.0 forProgressRangeStart:0.5 end:1.0];
    bottomBarBehaviorDefiner.snappingEnabled = YES;
    bottomBarBehaviorDefiner.elasticMaximumHeightAtTop = NO;
    self.bottomBar.behaviorDefiner = bottomBarBehaviorDefiner;
    
    // Configure a separate UITableViewDelegate and UIScrollViewDelegate (optional)
    self.topBarDelegateSplitter = [[BLKDelegateSplitter alloc] initWithFirstDelegate:topBarBehaviorDefiner secondDelegate:self];
    self.bottomBarDelegateSplitter = [[BLKDelegateSplitter alloc] initWithFirstDelegate:bottomBarBehaviorDefiner secondDelegate:self.topBarDelegateSplitter];
    self.tableView.delegate = (id<UITableViewDelegate>)self.bottomBarDelegateSplitter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)closeViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


# pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    return cell;
}

@end
