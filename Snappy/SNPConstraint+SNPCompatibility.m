//
//  Snappy
//
//  Copyright (c) 2011-2014 Masonry Team - https://github.com/Masonry
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "SNPConstraint+SNPCompatibility.h"

@interface SNPConstraint (SNPCompatibilitySwift)

- (void)snp_objc_setRelationToConstraintItem:(id)value layoutRelation:(NSLayoutRelation)layoutRelation;
- (void)snp_objc_setRelationToView:(SNPView *)value layoutRelation:(NSLayoutRelation)layoutRelation;
- (void)snp_objc_setRelationToCGFloat:(CGFloat)value layoutRelation:(NSLayoutRelation)layoutRelation;
- (void)snp_objc_setRelationToCGPoint:(CGPoint)value layoutRelation:(NSLayoutRelation)layoutRelation;
- (void)snp_objc_setRelationToCGSize:(CGSize)value layoutRelation:(NSLayoutRelation)layoutRelation;
- (void)snp_objc_setRelationToEdgeInsets:(SNPEdgeInsets)value layoutRelation:(NSLayoutRelation)layoutRelation;

- (void)snp_objc_setOffsetToCGFloat:(CGFloat)value;
- (void)snp_objc_setOffsetToCGPoint:(CGPoint)value;
- (void)snp_objc_setOffsetToCGSize:(CGSize)value;
- (void)snp_objc_setOffsetToEdgeInsets:(SNPEdgeInsets)value;

- (void)snp_objc_setMultipledBy:(CGFloat)value;
- (void)snp_objc_setDividedBy:(CGFloat)value;

- (void)snp_objc_setPriority:(CGFloat)value;

@end

@implementation SNPConstraint (SNPCompatibility)

#pragma mark -

@dynamic equalTo;
@dynamic greaterThanOrEqualTo;
@dynamic lessThanOrEqualTo;

- (void)setRelationToValue:(id)value layoutRelation:(NSLayoutRelation)layoutRelation {
    if([value isKindOfClass:[SNPView class]]) {
        [self snp_objc_setRelationToView:value layoutRelation:layoutRelation];
    } else if([value isKindOfClass:NSNumber.class]) {
        CGFloat primitiveValue = [value doubleValue];
        [self snp_objc_setRelationToCGFloat:primitiveValue layoutRelation:layoutRelation];
    } else if (strcmp([value objCType], @encode(CGPoint)) == 0) {
        CGPoint primitiveValue;
        [value getValue:&primitiveValue];
        [self snp_objc_setRelationToCGPoint:primitiveValue layoutRelation:layoutRelation];
    } else if(strcmp([value objCType], @encode(CGSize)) == 0) {
        CGSize primitiveValue;
        [value getValue:&primitiveValue];
        [self snp_objc_setRelationToCGSize:primitiveValue layoutRelation:layoutRelation];
    } else if (strcmp([value objCType], @encode(SNPEdgeInsets)) == 0) {
        SNPEdgeInsets primitiveValue;
        [value getValue:&primitiveValue];
        [self snp_objc_setRelationToEdgeInsets:primitiveValue layoutRelation:layoutRelation];
    } else if([NSStringFromClass([value class]) hasSuffix:@"ConstraintItem"]) {
        [self snp_objc_setRelationToConstraintItem:value layoutRelation:layoutRelation];
    } else {
        NSAssert(NO, @"attempting to set layout constant(s) or right hand side with unsupported value: %@", value);
    }
}

- (SNPConstraint *(^)(id))equalTo {
    return ^SNPConstraint* (id value) {
        [self setRelationToValue:value layoutRelation:NSLayoutRelationEqual];
        return self;
    };
}
- (SNPConstraint *(^)(id))greaterThanOrEqualTo {
    return ^SNPConstraint* (id value) {
        [self setRelationToValue:value layoutRelation:NSLayoutRelationGreaterThanOrEqual];
        return self;
    };
}
- (SNPConstraint *(^)(id))lessThanOrEqualTo {
    return ^SNPConstraint* (id value) {
        [self setRelationToValue:value layoutRelation:NSLayoutRelationLessThanOrEqual];
        return self;
    };
}

#pragma mark -

@dynamic offset;
@dynamic valueOffset;
@dynamic insets;
@dynamic sizeOffset;
@dynamic centerOffset;

- (SNPConstraint *(^)(CGFloat))offset {
    return ^SNPConstraint* (CGFloat value) {
        [self snp_objc_setOffsetToCGFloat:value];
        return self;
    };
}
- (SNPConstraint *(^)(id))valueOffset {
    return ^SNPConstraint* (id value) {
        if([value isKindOfClass:NSNumber.class]) {
            CGFloat primitiveValue = [value doubleValue];
            [self snp_objc_setOffsetToCGFloat:primitiveValue];
        } else if (strcmp([value objCType], @encode(CGPoint)) == 0) {
            CGPoint primitiveValue;
            [value getValue:&primitiveValue];
            [self snp_objc_setOffsetToCGPoint:primitiveValue];
        } else if(strcmp([value objCType], @encode(CGSize)) == 0) {
            CGSize primitiveValue;
            [value getValue:&primitiveValue];
            [self snp_objc_setOffsetToCGSize:primitiveValue];
        } else if (strcmp([value objCType], @encode(SNPEdgeInsets)) == 0) {
            SNPEdgeInsets primitiveValue;
            [value getValue:&primitiveValue];
            [self snp_objc_setOffsetToEdgeInsets:primitiveValue];
        } else {
            NSAssert(NO, @"attempting to set layout constant(s) with unsupported value: %@", value);
        }
        return self;
    };
}
- (SNPConstraint *(^)(SNPEdgeInsets))insets {
    return ^SNPConstraint* (SNPEdgeInsets value) {
        [self snp_objc_setOffsetToEdgeInsets:value];
        return self;
    };
}
- (SNPConstraint *(^)(CGSize))sizeOffset {
    return ^SNPConstraint* (CGSize value) {
        [self snp_objc_setOffsetToCGSize:value];
        return self;
    };
}
- (SNPConstraint *(^)(CGPoint))centerOffset {
    return ^SNPConstraint* (CGPoint value) {
        [self snp_objc_setOffsetToCGPoint:value];
        return self;
    };
}

#pragma mark - 

@dynamic multipliedBy;
@dynamic dividedBy;

- (SNPConstraint *(^)(CGFloat))multipliedBy {
    return ^SNPConstraint* (CGFloat value) {
        [self snp_objc_setMultipledBy:value];
        return self;
    };
}
- (SNPConstraint *(^)(CGFloat))dividedBy {
    return ^SNPConstraint* (CGFloat value) {
        [self snp_objc_setDividedBy:value];
        return self;
    };
}

#pragma mark - 

@dynamic priority;
@dynamic priorityRequired;
@dynamic priorityHigh;
@dynamic priorityLow;

- (SNPConstraint *(^)(CGFloat))priority {
    return ^SNPConstraint* (CGFloat value) {
        [self snp_objc_setPriority:value];
        return self;
    };
}
- (SNPConstraint *(^)(void))priorityRequired {
    return ^SNPConstraint* (void) {
        [self snp_objc_setPriority:1000.0];
        return self;
    };
}
- (SNPConstraint *(^)(void))priorityHigh {
    return ^SNPConstraint* (void) {
        [self snp_objc_setPriority:750.0];
        return self;
    };
}
- (SNPConstraint *(^)(void))priorityLow {
    return ^SNPConstraint* (void) {
        [self snp_objc_setPriority:250.0];
        return self;
    };
}


@end
