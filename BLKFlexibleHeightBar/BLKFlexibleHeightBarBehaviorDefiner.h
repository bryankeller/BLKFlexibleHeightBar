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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BLKFlexibleHeightBar;

/**
 The `BLKFlexibleHeightBarBehaviorDefiner` class is responsible for defining how its `BLKFlexibleHeightBar` instance will behave. Often, this behavior is tightly coupled with scroll events (i.e. a `UITableView` scrolling to the top). Because of this close relationship between bar behavior and scroll events, behavior definers conform to `UIScrollViewDelegate.` A behavior definer should set its bar's `progress` property to adjust the bar's height.
 The base class `BLKFlexibleHeightBarBehaviorDefiner` does not attempt to adjust the bar's height based on scroll position, leaving it up to subclasses to implement custom bar behavior based on scrolling. The base class does, however, provide snapping behavior support. Snapping forces the bar to always snap to one of the defined snapping progress values.
 */

@interface BLKFlexibleHeightBarBehaviorDefiner : NSObject <UIScrollViewDelegate>

/**
 The `BLKFlexibleHeightBar` instance corresponding with the behavior definer.
 */
@property (nonatomic, readonly, weak) BLKFlexibleHeightBar *flexibleHeightBar;

/**
 Determines whether snapping is enabled or not. Default value is YES.
 */
@property (nonatomic, getter=isSnappingEnabled) BOOL snappingEnabled;

/**
 Determines whether the bar is current snapping or not.
 */
@property (nonatomic, getter=isCurrentlySnapping) BOOL currentlySnapping;

/**
 Determines whether the bar can stretch to larger sizes than it's `maximumBarHeight`. Default value is NO.
 */
@property (nonatomic, getter=isElasticMaximumHeightAtTop) BOOL elasticMaximumHeightAtTop;


/**
 Add a progress position that the bar will snap to whenever a user stops scrolling and the bar's current progress falls within the specified progress range.
 @param The progress position that the bar will snap to.
 @param The range of progress percents (between 0.0 and 1.0 inclusive) that will cause the bar to snap to the specified `progressPosition.`
 */
- (void)addSnappingPositionProgress:(CGFloat)progress forProgressRangeStart:(CGFloat)start end:(CGFloat)end;

/**
 Removes the progress position corresponding to the specified progress range.
 @param The range of progress percents (between 0.0 and 1.0 inclusive) that correspond with the `progressPosition` that is to be removed.
 */
- (void)removeSnappingPositionProgressForProgressRangeStart:(CGFloat)start end:(CGFloat)end;

/**
 Snap to the specified progress position.
 @param The progress position that the bar will snap to.
 @param The UIScrollView whose offset will be adjusted during the snap.
 */
- (void)snapToProgress:(CGFloat)progress scrollView:(UIScrollView *)scrollView;

/**
 Snap to the appropriate progress position based on the bar's current progress and the currently defined snapping position progresses.
 @param The UIScrollView whose offset will be adjusted during the snap.
 */
- (void)snapWithScrollView:(UIScrollView *)scrollView;

@end
