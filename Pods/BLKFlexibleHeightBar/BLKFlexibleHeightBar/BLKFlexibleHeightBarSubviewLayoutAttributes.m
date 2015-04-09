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

#import "BLKFlexibleHeightBarSubviewLayoutAttributes.h"

@implementation BLKFlexibleHeightBarSubviewLayoutAttributes

- (instancetype)init
{
    if(self = [super init])
    {
        _frame = CGRectZero;
        _bounds = CGRectZero;
        _center = CGPointZero;
        _size = CGSizeZero;
        _transform3D = CATransform3DIdentity;
        _transform = CGAffineTransformIdentity;
        _alpha = 1.0;
        _zIndex = 0;
        _hidden = NO;
    }
    
    return self;
}

- (instancetype)initWithExistingLayoutAttributes:(BLKFlexibleHeightBarSubviewLayoutAttributes *)layoutAttributes
{
    if(self = [super init])
    {
        _frame = layoutAttributes.frame;
        _bounds = layoutAttributes.bounds;
        _center = layoutAttributes.center;
        _size = layoutAttributes.size;
        _transform3D = layoutAttributes.transform3D;
        _transform = layoutAttributes.transform;
        _alpha = layoutAttributes.alpha;
        _zIndex = layoutAttributes.zIndex;
        _hidden = layoutAttributes.hidden;
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    if(CGAffineTransformIsIdentity(_transform) && CATransform3DIsIdentity(_transform3D))
    {
        _frame = frame;
    }
    
    _center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    _size = CGSizeMake(CGRectGetWidth(_frame), CGRectGetHeight(_frame));
    _bounds = CGRectMake(CGRectGetMinX(_bounds), CGRectGetMinY(_bounds), _size.width, _size.height);
}

- (void)setBounds:(CGRect)bounds
{
    NSAssert(bounds.origin.x == 0.0 && bounds.origin.y == 0.0, @"Bounds must be set with a (0,0) origin");
    
    _bounds = bounds;

    _size = CGSizeMake(CGRectGetWidth(_bounds), CGRectGetHeight(_bounds));
}

- (void)setCenter:(CGPoint)center
{
    _center = center;
    
    if(CGAffineTransformIsIdentity(_transform) && CATransform3DIsIdentity(_transform3D))
    {
        _frame = CGRectMake(center.x-CGRectGetMidX(_bounds), center.y-CGRectGetMidY(_bounds), CGRectGetWidth(_frame), CGRectGetHeight(_frame));
    }
}

- (void)setSize:(CGSize)size
{
    _size = size;
    
    if(CGAffineTransformIsIdentity(_transform) && CATransform3DIsIdentity(_transform3D))
    {
        _frame = CGRectMake(CGRectGetMinX(_frame), CGRectGetMinY(_frame), size.width, size.height);
    }
    
    _bounds = CGRectMake(CGRectGetMinX(_bounds), CGRectGetMinY(_bounds), size.width, size.height);
}

- (void)setTransform3D:(CATransform3D)transform3D
{
    _transform3D = transform3D;
    
    _transform = CGAffineTransformMake(transform3D.m11, transform3D.m12, transform3D.m21, transform3D.m22, transform3D.m41, transform3D.m42);
    
    if(!CATransform3DIsIdentity(transform3D))
    {
        _frame = CGRectNull;
    }
}

- (void)setTransform:(CGAffineTransform)transform
{
    _transform = transform;
    
    _transform3D = CATransform3DMakeAffineTransform(transform);
    
    if(!CGAffineTransformIsIdentity(transform))
    {
        _frame = CGRectNull;
    }
}

@end
