/*
 Copyright (c) 2015, Bryan Keller. All rights reserved.
 Licensed under the MIT license <http://opensource.org/licenses/MIT>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 documentation files (the "Software"), to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
 to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions
 of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 IN THE SOFTWARE.
 */

#import "SafariStyleBehaviorDefiner.h"
#import "BLKFlexibleHeightBar.h"

#define kDefaultVelocityThreshold   0.4

@interface SafariStyleBehaviorDefiner ()
{
    CGFloat previousScrollPosition;
}
@end

@implementation SafariStyleBehaviorDefiner

#pragma mark -
#pragma mark Init

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.velocityThreshold = kDefaultVelocityThreshold;
    }
    return self;
}

#pragma mark -
#pragma mark Scroll view delegate methods

- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{
    [super scrollViewWillBeginDragging:scrollView];

    previousScrollPosition = scrollView.contentOffset.y + scrollView.contentInset.top;
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    [super scrollViewDidScroll:scrollView];
    
    CGFloat scrollPosition = scrollView.contentOffset.y + scrollView.contentInset.top;

    if (!self.isCurrentlySnapping)
    {
        CGFloat newProgress = self.flexibleHeightBar.progress;
        
        if (scrollPosition < 0.0)
        {
            newProgress = 0.0;
        }
        else if ((scrollView.contentOffset.y - scrollView.contentInset.bottom) >= scrollView.contentSize.height)
        {
            newProgress = 1.0;
        }
        else
        {
            CGFloat barHeight = self.flexibleHeightBar.maximumBarHeight - self.flexibleHeightBar.minimumBarHeight;
            CGFloat progressDelta = (scrollPosition - previousScrollPosition) / barHeight;

            if ((progressDelta > 0.0) || (scrollPosition < barHeight))
            {
                newProgress += progressDelta;
            }
        }

        if (self.flexibleHeightBar.progress != newProgress)
        {
            self.flexibleHeightBar.progress = newProgress;
            [self.flexibleHeightBar setNeedsLayout];
        }
    }
    
    previousScrollPosition = scrollPosition;
}

- (void)scrollViewWillEndDragging:(UIScrollView*)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint*)targetContentOffset
{
    [super scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    
    if (velocity.y < -self.velocityThreshold)
    {
        self.flexibleHeightBar.progress = 0.0;
        
        [self snapWithScrollView:scrollView];
    }
}

@end

#undef kDefaultVelocityThreshold
