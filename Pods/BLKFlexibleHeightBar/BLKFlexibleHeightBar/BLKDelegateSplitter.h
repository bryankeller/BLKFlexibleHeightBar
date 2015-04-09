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

/**
 The `BLKDelegateSplitter` class is used to allow a class like UITableView to have a UITableViewDelegate (inherits from UIScrollViewDelegate) and a separate UIScrollViewDelegate.
 
 In the BLKFlexibleHeightBar library, this pattern becomes necessary when a UITableView sets its delegate to an instance of `BLKFlexibleHeightBarBehaviorDefiner` but also wants another class to act as the UITableViewDelegate.
 */

@interface BLKDelegateSplitter : NSObject <NSObject>

/**
 The first delegate.
 */
@property (nonatomic, weak) id<NSObject> firstDelegate;

/**
 The second delegate.
 */
@property (nonatomic, weak) id<NSObject> secondDelegate;

/**
 A convenience initializer that sets the first and second delegate.
 @param The existing layout attributes.
 @return A delegate splitter instance, or nil of initialization fails.
 */
- (instancetype)initWithFirstDelegate:(id<NSObject>)firstDelegate secondDelegate:(id<NSObject>)secondDelegate;

@end
