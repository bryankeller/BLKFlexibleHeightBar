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

#import "BLKFlexibleHeightBar.h"

@interface BLKFlexibleHeightBar ()

@end

@implementation BLKFlexibleHeightBar

- (void)commonInit
{
    _progress = 0.0;
    _maximumBarHeight = 44.0;
    _minimumBarHeight = 20.0;
}

- (instancetype)init
{
    if(self = [super init])
    {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self commonInit];
        _maximumBarHeight = CGRectGetMaxY(frame);
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self commonInit];
    self.maximumBarHeight = CGRectGetMaxY(self.bounds);
}

- (void)setMaximumBarHeight:(CGFloat)maximumBarHeight
{
    _maximumBarHeight = fmax(maximumBarHeight, 0.0);
}

- (void)setMinimumBarHeight:(CGFloat)minimumBarHeight
{
    _minimumBarHeight = fmax(minimumBarHeight, 0.0);
}


# pragma mark - Layout attributes

- (void)layoutSubviews
{
    [super layoutSubviews];

    // Update height
    CGRect barFrame = self.frame;
    barFrame.size.height = [self interpolateFromValue:self.maximumBarHeight toValue:self.minimumBarHeight withProgress:self.progress];
    self.frame = barFrame;
    
    if(self.behaviorDefiner && self.behaviorDefiner.isElasticMaximumHeightAtTop)
    {
        self.progress = fmax(self.progress, 0.0);
    }
    
    // Update subviews using the appropriate layout attributes for the current progress
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIView *subview = obj;
        for(int i = 0; i < [subview numberOfLayoutAttributes]; i++)
        {
            CGFloat floorProgressPosition = [subview progressAtIndex:i];
            
            if(i+1 < [subview numberOfLayoutAttributes])
            {
                CGFloat ceilingProgressPosition = [subview progressAtIndex:i+1];
                
                if(self.progress >= floorProgressPosition && self.progress < ceilingProgressPosition)
                {
                    BLKFlexibleHeightBarSubviewLayoutAttributes *floorLayoutAttributes = [subview layoutAttributesAtIndex:i];
                    BLKFlexibleHeightBarSubviewLayoutAttributes *ceilingLayoutAttributes = [subview layoutAttributesAtIndex:i+1];
                    
                    [self applyFloorLayoutAttributes:floorLayoutAttributes ceilingLayoutAttributes:ceilingLayoutAttributes toSubview:subview withFloorProgress:floorProgressPosition ceilingProgress:ceilingProgressPosition];
                }
            }
            else
            {
                if(self.progress >= floorProgressPosition)
                {
                    BLKFlexibleHeightBarSubviewLayoutAttributes *floorLayoutAttributes = [subview layoutAttributesAtIndex:i];
                    
                    [self applyFloorLayoutAttributes:floorLayoutAttributes ceilingLayoutAttributes:floorLayoutAttributes toSubview:subview withFloorProgress:floorProgressPosition ceilingProgress:1.0];
                }
            }
        }
        
    }];
}

- (void)applyFloorLayoutAttributes:(BLKFlexibleHeightBarSubviewLayoutAttributes *)floorLayoutAttributes ceilingLayoutAttributes:(BLKFlexibleHeightBarSubviewLayoutAttributes *)ceilingLayoutAttributes toSubview:(UIView *)subview withFloorProgress:(CGFloat)floorProgress ceilingProgress:(CGFloat)ceilingProgress;
{
    CGFloat numerator = self.progress-floorProgress;
    CGFloat denominator;
    if(ceilingProgress == floorProgress)
    {
        denominator = ceilingProgress;
    }
    else
    {
        denominator = ceilingProgress-floorProgress;
    }
    CGFloat relativeProgress = numerator/denominator;

    
    // Interpolate CA3DTransform
    CATransform3D transform3D;
    transform3D.m11 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m11 toValue:ceilingLayoutAttributes.transform3D.m11 withProgress:relativeProgress];
    transform3D.m12 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m12 toValue:ceilingLayoutAttributes.transform3D.m12 withProgress:relativeProgress];
    transform3D.m13 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m13 toValue:ceilingLayoutAttributes.transform3D.m13 withProgress:relativeProgress];
    transform3D.m14 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m14 toValue:ceilingLayoutAttributes.transform3D.m14 withProgress:relativeProgress];
    transform3D.m21 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m21 toValue:ceilingLayoutAttributes.transform3D.m21 withProgress:relativeProgress];
    transform3D.m22 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m22 toValue:ceilingLayoutAttributes.transform3D.m22 withProgress:relativeProgress];
    transform3D.m23 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m23 toValue:ceilingLayoutAttributes.transform3D.m23 withProgress:relativeProgress];
    transform3D.m24 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m24 toValue:ceilingLayoutAttributes.transform3D.m24 withProgress:relativeProgress];
    transform3D.m31 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m31 toValue:ceilingLayoutAttributes.transform3D.m31 withProgress:relativeProgress];
    transform3D.m32 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m32 toValue:ceilingLayoutAttributes.transform3D.m32 withProgress:relativeProgress];
    transform3D.m33 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m33 toValue:ceilingLayoutAttributes.transform3D.m33 withProgress:relativeProgress];
    transform3D.m34 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m34 toValue:ceilingLayoutAttributes.transform3D.m34 withProgress:relativeProgress];
    transform3D.m41 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m41 toValue:ceilingLayoutAttributes.transform3D.m41 withProgress:relativeProgress];
    transform3D.m42 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m42 toValue:ceilingLayoutAttributes.transform3D.m42 withProgress:relativeProgress];
    transform3D.m43 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m43 toValue:ceilingLayoutAttributes.transform3D.m43 withProgress:relativeProgress];
    transform3D.m44 = [self interpolateFromValue:floorLayoutAttributes.transform3D.m44 toValue:ceilingLayoutAttributes.transform3D.m44 withProgress:relativeProgress];
    
    // Interpolate frame
    CGRect frame;
    if(!CGRectEqualToRect(floorLayoutAttributes.frame, CGRectNull) && CGRectEqualToRect(ceilingLayoutAttributes.frame, CGRectNull))
    {
        frame = floorLayoutAttributes.frame;
    }
    else if(CGRectEqualToRect(floorLayoutAttributes.frame, CGRectNull) && CGRectEqualToRect(ceilingLayoutAttributes.frame, CGRectNull))
    {
        frame = subview.frame;
    }
    else
    {
        CGFloat x = [self interpolateFromValue:CGRectGetMinX(floorLayoutAttributes.frame) toValue:CGRectGetMinX(ceilingLayoutAttributes.frame) withProgress:relativeProgress];
        CGFloat y = [self interpolateFromValue:CGRectGetMinY(floorLayoutAttributes.frame) toValue:CGRectGetMinY(ceilingLayoutAttributes.frame) withProgress:relativeProgress];
        CGFloat width = [self interpolateFromValue:CGRectGetWidth(floorLayoutAttributes.frame) toValue:CGRectGetWidth(ceilingLayoutAttributes.frame) withProgress:relativeProgress];
        CGFloat height = [self interpolateFromValue:CGRectGetHeight(floorLayoutAttributes.frame) toValue:CGRectGetHeight(ceilingLayoutAttributes.frame) withProgress:relativeProgress];
        frame = CGRectMake(x, y, width, height);
    }
    
    // Interpolate center
    CGFloat x = [self interpolateFromValue:floorLayoutAttributes.center.x toValue:ceilingLayoutAttributes.center.x withProgress:relativeProgress];
    CGFloat y = [self interpolateFromValue:floorLayoutAttributes.center.y toValue:ceilingLayoutAttributes.center.y withProgress:relativeProgress];
    CGPoint center = CGPointMake(x, y);
    
    // Interpolate bounds
    x = [self interpolateFromValue:CGRectGetMinX(floorLayoutAttributes.bounds) toValue:CGRectGetMinX(ceilingLayoutAttributes.bounds) withProgress:relativeProgress];
    y = [self interpolateFromValue:CGRectGetMinY(floorLayoutAttributes.bounds) toValue:CGRectGetMinY(ceilingLayoutAttributes.bounds) withProgress:relativeProgress];
    CGFloat width = [self interpolateFromValue:CGRectGetWidth(floorLayoutAttributes.bounds) toValue:CGRectGetWidth(ceilingLayoutAttributes.bounds) withProgress:relativeProgress];
    CGFloat height = [self interpolateFromValue:CGRectGetHeight(floorLayoutAttributes.bounds) toValue:CGRectGetHeight(ceilingLayoutAttributes.bounds) withProgress:relativeProgress];
    CGRect bounds = CGRectMake(x, y, width, height);
    
    // Interpolate alpha
    CGFloat alpha = [self interpolateFromValue:floorLayoutAttributes.alpha toValue:ceilingLayoutAttributes.alpha withProgress:relativeProgress];
    
    
    // Apply updated attributes
    subview.layer.transform = transform3D;
    if(CATransform3DIsIdentity(transform3D))
    {
        subview.frame = frame;
    }
    subview.center = center;
    subview.bounds = bounds;
    subview.alpha = alpha;
    subview.layer.zPosition = floorLayoutAttributes.zIndex;
    subview.hidden = floorLayoutAttributes.isHidden;
}

- (CGFloat)interpolateFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue withProgress:(CGFloat)progress
{
    return fromValue - ((fromValue-toValue) * progress);
}

# pragma mark - Overridden setters

- (void)setProgress:(CGFloat)progress
{
    _progress = fmin(progress, 1.0);
    if((self.behaviorDefiner && !self.behaviorDefiner.isElasticMaximumHeightAtTop) || !self.behaviorDefiner)
    {
        _progress = fmax(_progress, 0.0);
    }
}

- (void)setBehaviorDefiner:(BLKFlexibleHeightBarBehaviorDefiner *)behaviorDefiner
{
    _behaviorDefiner = behaviorDefiner;
    
# pragma clang diagnostic push
# pragma clang diagnostic ignored "-Wundeclared-selector"
    
    [_behaviorDefiner performSelector:@selector(BLK_Private_setFlexibleHeightBar:) withObject:self];
    
# pragma clang diagnostic pop
}

@end
