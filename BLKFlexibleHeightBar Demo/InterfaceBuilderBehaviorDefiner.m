//
//  InterfaceBuilderBehaviourDefiner.m
//  BLKFlexibleHeightBar Demo
//
//  Created by Denis Zamataev on 14/01/16.
//  Copyright © 2016 Bryan Keller. All rights reserved.
//

#import "InterfaceBuilderBehaviorDefiner.h"
#import "BLKFlexibleHeightBar.h"


@implementation InterfaceBuilderBehaviorDefiner
# pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [super scrollViewDidScroll:scrollView];
    
    if(!self.isCurrentlySnapping)
    {
        CGFloat progress = (scrollView.contentOffset.y+scrollView.contentInset.top) / (self.flexibleHeightBar.maximumBarHeight-self.flexibleHeightBar.minimumBarHeight);
        self.flexibleHeightBar.progress = progress;
        [self.flexibleHeightBar setNeedsLayout];
    }
}
@end
