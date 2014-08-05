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

import Foundation

#if os(iOS)
import UIKit
#else
import AppKit
#endif

extension Constraint {
    
    internal func snp_objc_setRelationToConstraintItem(other: ConstraintItem, layoutRelation: NSLayoutRelation) {
        self.constrainTo(other, relation: ConstraintRelation.fromRaw(layoutRelation.toRaw())!)
    }
    internal func snp_objc_setRelationToView(other: View, layoutRelation: NSLayoutRelation) {
        self.constrainTo(other, relation: ConstraintRelation.fromRaw(layoutRelation.toRaw())!)
    }
    internal func snp_objc_setRelationToCGFloat(other: CGFloat, layoutRelation: NSLayoutRelation) {
        self.constrainTo(Float(other), relation: ConstraintRelation.fromRaw(layoutRelation.toRaw())!)
    }
    internal func snp_objc_setRelationToCGPoint(other: CGPoint, layoutRelation: NSLayoutRelation) {
        self.constrainTo(other, relation: ConstraintRelation.fromRaw(layoutRelation.toRaw())!)
    }
    internal func snp_objc_setRelationToCGSize(other: CGSize, layoutRelation: NSLayoutRelation) {
        self.constrainTo(other, relation: ConstraintRelation.fromRaw(layoutRelation.toRaw())!)
    }
    internal func snp_objc_setRelationToEdgeInsets(other: EdgeInsets, layoutRelation: NSLayoutRelation) {
        self.constrainTo(other, relation: ConstraintRelation.fromRaw(layoutRelation.toRaw())!)
    }
    
    internal func snp_objc_setOffsetToCGFloat(other: CGFloat) {
        self.offset(Float(other))
    }
    internal func snp_objc_setOffsetToCGPoint(other: CGPoint) {
        self.offset(other)
    }
    internal func snp_objc_setOffsetToCGSize(other: CGSize) {
        self.offset(other)
    }
    internal func snp_objc_setOffsetToEdgeInsets(other: EdgeInsets) {
        self.offset(other)
    }
    
    internal func snp_objc_setMultipliedBy(other: CGFloat) {
        self.multipliedBy(Float(other))
    }
    internal func snp_objc_setDiviedBy(other: CGFloat) {
        self.dividedBy(Float(other))
    }
    
    internal func snp_objc_setPriority(other: CGFloat) {
        self.priority(Float(other))
    }
    
}