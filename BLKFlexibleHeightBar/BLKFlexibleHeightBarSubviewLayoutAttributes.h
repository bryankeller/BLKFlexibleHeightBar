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
 The `BLKFlexibleHeightBarSubviewLayoutAttributes` class is used to define layout attributes (i.e frame, transform, alpha) for subviews of a `BLKFlexibleHeightBar`.
 Note: This class is heavily influenced by UICollectionViewLayoutAttributes.
 */

@interface BLKFlexibleHeightBarSubviewLayoutAttributes : NSObject

/**
 The frame rectangle of the item.
 The frame rectangle is measured in points and specified in the coordinate system of the collection view. Setting the value of this property also sets the values of the center and size properties.
 */
@property (nonatomic) CGRect frame;

/**
 The bounds of the item.
 When setting the bounds, the origin of the bounds rectangle must always be at (0, 0). Changing the bounds rectangle also changes the value in the size property to match the new bounds size.
 */
@property (nonatomic) CGRect bounds;

/**
 The center point of the item.
 The center point is specified in the coordinate system of the collection view. Setting the value of this property also updates the origin of the rectangle in the frame property.
 */
@property (nonatomic) CGPoint center;

/**
 The size of the item.
 Setting the value of this property also changes the size of the rectangle returned by the frame and bounds properties.
 */
@property (nonatomic) CGSize size;

/**
 The 3D transform of the item.
 Assigning a transform other than the identity transform to this property causes the frame property to be set to CGRectNull. Assigning a value also replaces the value in the transform property with an affine version of the 3D transform you specify.
 */
@property (nonatomic) CATransform3D transform3D;

/**
 The affine transform of the item.
 Assigning a transform other than the identity transform to this property causes the frame property to be set to CGRectNull. Assigning a value also replaces the value in the transform3D property with a 3D version of the affine transform you specify.
 */
@property (nonatomic) CGAffineTransform transform;

/**
 The transparency of the item.
 Possible values are between 0.0 (transparent) and 1.0 (opaque). The default is 1.0.
 */
@property (nonatomic) CGFloat alpha;

/**
 Specifies the item’s position on the z axis.
 This property is used to determine the front-to-back ordering of items during layout. Items with higher index values appear on top of items with lower values. Items with the same value have an undetermined order.
 
 The default value of this property is 0.
 */
@property (nonatomic) NSInteger zIndex;

/**
 Determines whether the item is currently displayed.
 The default value of this property is NO. As an optimization, the collection view might not create the corresponding view if this property is set to YES.
 */
@property (nonatomic, getter=isHidden) BOOL hidden;


/**
 A convenience initializer that returns layout attributes with the same property values as the specified layout attributes, or nil of initialization fails.
 @param The existing layout attributes.
 @return Layout attributes with the same property values as the specified layout attributes, or nil of initialization fails.
 */
- (instancetype)initWithExistingLayoutAttributes:(BLKFlexibleHeightBarSubviewLayoutAttributes *)layoutAttributes;

@end
