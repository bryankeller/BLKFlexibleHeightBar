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

#import "BLKDelegateSplitter.h"

@implementation BLKDelegateSplitter

- (instancetype)initWithFirstDelegate:(id<NSObject>)firstDelegate secondDelegate:(id<NSObject>)secondDelegate
{
    if(self = [super init])
    {
        _firstDelegate = firstDelegate;
        _secondDelegate = secondDelegate;
    }
    
    return self;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL aSelector = [anInvocation selector];
    
    if([self.firstDelegate respondsToSelector:aSelector])
    {
        [anInvocation invokeWithTarget:self.firstDelegate];
    }
    
    if([self.secondDelegate respondsToSelector:aSelector])
    {
        [anInvocation invokeWithTarget:self.secondDelegate];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *first = [(NSObject *)self.firstDelegate methodSignatureForSelector:aSelector];
    NSMethodSignature *second = [(NSObject *)self.secondDelegate methodSignatureForSelector:aSelector];
    
    if(first)
    {
        return first;
    }
    else if(second)
    {
        return second;
    }
    
    return nil;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if([self.firstDelegate respondsToSelector:aSelector] || [self.secondDelegate respondsToSelector:aSelector])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end