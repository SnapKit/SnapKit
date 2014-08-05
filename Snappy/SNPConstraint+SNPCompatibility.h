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

#import "SNPPlatform.h"
#import "SNPUtilities.h"
#import "SNPConstraint.h"

@interface SNPConstraint (SNPCompatibility)

@property (nonatomic, strong, readonly) SNPConstraint* (^equalTo)(id other);
@property (nonatomic, strong, readonly) SNPConstraint* (^lessThanOrEqualTo)(id other);
@property (nonatomic, strong, readonly) SNPConstraint* (^greaterThanOrEqualTo)(id other);

@property (nonatomic, strong, readonly) SNPConstraint* (^offset)(CGFloat value);
@property (nonatomic, strong, readonly) SNPConstraint* (^valueOffset)(id value);
@property (nonatomic, strong, readonly) SNPConstraint* (^insets)(SNPEdgeInsets value);
@property (nonatomic, strong, readonly) SNPConstraint* (^sizeOffset)(CGSize value);
@property (nonatomic, strong, readonly) SNPConstraint* (^centerOffset)(CGPoint value);

@property (nonatomic, strong, readonly) SNPConstraint* (^multipliedBy)(CGFloat value);
@property (nonatomic, strong, readonly) SNPConstraint* (^dividedBy)(CGFloat value);

@property (nonatomic, strong, readonly) SNPConstraint* (^priority)(CGFloat value);
@property (nonatomic, strong, readonly) SNPConstraint* (^priorityRequired)(void);
@property (nonatomic, strong, readonly) SNPConstraint* (^priorityHigh)(void);
@property (nonatomic, strong, readonly) SNPConstraint* (^priorityLow)(void);

@end

#define snp_equalTo(...)                 equalTo(SNPBoxValue((__VA_ARGS__)))
#define snp_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(SNPBoxValue((__VA_ARGS__)))
#define snp_lessThanOrEqualTo(...)       lessThanOrEqualTo(SNPBoxValue((__VA_ARGS__)))

#define snp_offset(...)                  valueOffset(SNPBoxValue((__VA_ARGS__)))

#if SNP_SHORTHAND

#define equalTo(...)                     snp_equalTo(__VA_ARGS__)
#define greaterThanOrEqualTo(...)        snp_greaterThanOrEqualTo(__VA_ARGS__)
#define lessThanOrEqualTo(...)           snp_lessThanOrEqualTo(__VA_ARGS__)

#define offset(...)                      snp_offset(__VA_ARGS__)

#endif