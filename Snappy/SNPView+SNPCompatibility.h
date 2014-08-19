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

@class SNPConstraintMaker;

@interface SNPView (SNPCompatibility)

#if SNP_SHORTHAND

@property (nonatomic, strong, readonly) id left;
@property (nonatomic, strong, readonly) id top;
@property (nonatomic, strong, readonly) id right;
@property (nonatomic, strong, readonly) id bottom;
@property (nonatomic, strong, readonly) id leading;
@property (nonatomic, strong, readonly) id trailing;
@property (nonatomic, strong, readonly) id width;
@property (nonatomic, strong, readonly) id height;
@property (nonatomic, strong, readonly) id centerX;
@property (nonatomic, strong, readonly) id centerY;
@property (nonatomic, strong, readonly) id baseline;

@property (nonatomic, strong, readonly) id edges;
@property (nonatomic, strong, readonly) id size;
@property (nonatomic, strong, readonly) id center;

- (void)makeConstraints:(void (^)(SNPConstraintMaker *make))block;
- (void)remakeConstraints:(void (^)(SNPConstraintMaker *make))block;

#else

@property (nonatomic, strong, readonly) id snp_left;
@property (nonatomic, strong, readonly) id snp_top;
@property (nonatomic, strong, readonly) id snp_right;
@property (nonatomic, strong, readonly) id snp_bottom;
@property (nonatomic, strong, readonly) id snp_leading;
@property (nonatomic, strong, readonly) id snp_trailing;
@property (nonatomic, strong, readonly) id snp_width;
@property (nonatomic, strong, readonly) id snp_height;
@property (nonatomic, strong, readonly) id snp_centerX;
@property (nonatomic, strong, readonly) id snp_centerY;
@property (nonatomic, strong, readonly) id snp_baseline;

@property (nonatomic, strong, readonly) id snp_edges;
@property (nonatomic, strong, readonly) id snp_size;
@property (nonatomic, strong, readonly) id snp_center;

- (void)snp_makeConstraints:(void (^)(SNPConstraintMaker *make))block;
- (void)snp_remakeConstraints:(void (^)(SNPConstraintMaker *make))block;

#endif

@end
