//
//  View.swift
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

#if os(iOS)
import UIKit
typealias View = UIView
#else
import AppKit
typealias View = NSView
#endif

extension View {
#if SNP_SHORTHAND
    var left: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Left) }
    var top: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Top) }
    var right: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Right) }
    var bottom: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Bottom) }
    var leading: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Leading) }
    var trailing: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Trailing) }
    var width: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Width) }
    var height: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Height) }
    var centerX: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.CenterX) }
    var centerY: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.CenterY) }
    var baseline: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Baseline) }
    
    var edges: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Edges) }
    var size: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Size) }
    var center: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Center) }
    
    func makeConstraints(block: (maker: ConstraintMaker) -> ()) {
        ConstraintMaker.makeConstraints(self, block: block)
    }
    
    func remakeConstraints(block: (maker: ConstraintMaker) -> ()) {
        ConstraintMaker.remakeConstraints(self, block: block)
    }
#else
    var snp_left: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Left) }
    var snp_top: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Top) }
    var snp_right: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Right) }
    var snp_bottom: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Bottom) }
    var snp_leading: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Leading) }
    var snp_trailing: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Trailing) }
    var snp_width: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Width) }
    var snp_height: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Height) }
    var snp_centerX: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.CenterX) }
    var snp_centerY: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.CenterY) }
    var snp_baseline: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Baseline) }
    
    var snp_edges: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Edges) }
    var snp_size: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Size) }
    var snp_center: ConstraintItem { return ConstraintItem(view: self, attributes: ConstraintAttributes.Center) }
    
    func snp_makeConstraints(block: (maker: ConstraintMaker) -> ()) {
        ConstraintMaker.makeConstraints(self, block: block)
    }
    
    func snp_remakeConstraints(block: (maker: ConstraintMaker) -> ()) {
        ConstraintMaker.remakeConstraints(self, block: block)
    }
    
#endif
}

