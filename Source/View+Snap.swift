//
//  Snap
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
public typealias View = UIView
#else
import AppKit
public typealias View = NSView
#endif

public extension View {
    
    // normal
    
    final public var snp_left: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Left) }
    final public var snp_top: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Top) }
    final public var snp_right: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Right) }
    final public var snp_bottom: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Bottom) }
    final public var snp_leading: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Leading) }
    final public var snp_trailing: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Trailing) }
    final public var snp_width: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Width) }
    final public var snp_height: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Height) }
    final public var snp_centerX: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterX) }
    final public var snp_centerY: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterY) }
    final public var snp_baseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    final public var snp_firstBaseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.FirstBaseline) }
    final public var snp_leftMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeftMargin) }
    final public var snp_rightMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.RightMargin) }
    final public var snp_topMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TopMargin) }
    final public var snp_bottomMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.BottomMargin) }
    final public var snp_leadingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeadingMargin) }
    final public var snp_trailingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TrailingMargin) }
    final public var snp_centerXWithinMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterXWithinMargins) }
    final public var snp_centerYWithinMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    // aggregates
    
    final public var snp_edges: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Edges) }
    final public var snp_size: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Size) }
    final public var snp_center: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Center) }
    
    #if os(iOS)
    final public var snp_margins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Margins) }
    final public var snp_centerWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterWithinMargins) }
    #endif
    
    final public func snp_prepareConstraints(@noescape block: (make: ConstraintMaker) -> Void) -> [Constraint] {
        return ConstraintMaker.prepareConstraints(self, block: block)
    }
    
    final public func snp_makeConstraints(@noescape block: (make: ConstraintMaker) -> Void) {
        ConstraintMaker.makeConstraints(self, block: block)
    }
    
    final public func snp_updateConstraints(@noescape block: (make: ConstraintMaker) -> Void) {
        ConstraintMaker.updateConstraints(self, block: block)
    }
    
    final public func snp_remakeConstraints(@noescape block: (make: ConstraintMaker) -> Void) {
        ConstraintMaker.remakeConstraints(self, block: block)
    }
    
    final public func snp_removeConstraints() {
        ConstraintMaker.removeConstraints(self)
    }
    
    // internal
    
    final internal var snp_installedLayoutConstraints: [LayoutConstraint] {
        get {
            if let constraints = objc_getAssociatedObject(self, &installedLayoutConstraintsKey) as? [LayoutConstraint] {
                return constraints
            }
            return []
        }
        set {
            objc_setAssociatedObject(self, &installedLayoutConstraintsKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
}

private var installedLayoutConstraintsKey = ""
