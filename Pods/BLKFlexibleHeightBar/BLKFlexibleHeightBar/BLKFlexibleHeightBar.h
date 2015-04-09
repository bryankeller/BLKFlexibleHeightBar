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

#import <UIKit/UIKit.h>

#import "BLKFlexibleHeightBarBehaviorDefiner.h"
#import "BLKFlexibleHeightBarSubviewLayoutAttributes.h"
#import "UIView+BLKFlexibleHeightBarSubview.h"

/**
 The `BLKFlexibleHeightBar` class is responsible for adjusting the layout attributes (i.e. frame, transform, alpha) of its subviews depending on its current height.
 
 The height of the bar is not set directy by adjusting the bar's frame. Rather, height adjustments are made by setting the `progress` property of the bar. The progress property represents how much the bar has shrunk, with 0% progress being the bar's full height and 100% progress being the bar's minimum height.
 
 `BLKFlexibleHeightBar` is designed to support any shrinking / growing behavior. For example, Safari's shrinking header and Facebook's shrinking header behave differently. Bar behaviors can be mix and matched (and hot swapped) by setting the bar's `behaviorDefiner` property.
 */

@interface BLKFlexibleHeightBar : UIView

/**
 The current progress, representing how much the bar has shrunk. progress == 0.0 puts the bar at its maximum height. progress == 1.0 puts the bar at its minimum height. The default value is 0.0.
 @warning `progress` is bounded between 0.0 and 1.0 inclusive unless the bar's `behaviorDefiner` instance has its `elasticMaximumHeightAtTop` set to YES.
 */
@property (nonatomic) CGFloat progress;

/**
 The non-negative maximum height for the bar. The default value is 44.0.
 */
@property (nonatomic) CGFloat maximumBarHeight;

/**
 The non-negative minimum height for the bar. The default value is 20.0.
 */
@property (nonatomic) CGFloat minimumBarHeight;

/**
 The behavior definer for the bar. Behavior definers are instances of `BLKFlexibleHeightBarBehaviorDefiner.` Behavior definers can be changed at run time to provide a different behavior.
 */
@property (nonatomic) BLKFlexibleHeightBarBehaviorDefiner *behaviorDefiner;

@end
