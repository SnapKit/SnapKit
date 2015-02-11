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
    
    public var snp_left: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Left) }
    public var snp_top: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Top) }
    public var snp_right: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Right) }
    public var snp_bottom: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Bottom) }
    public var snp_leading: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Leading) }
    public var snp_trailing: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Trailing) }
    public var snp_width: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Width) }
    public var snp_height: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Height) }
    public var snp_centerX: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterX) }
    public var snp_centerY: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterY) }
    public var snp_baseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    public var snp_firstBaseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.FirstBaseline) }
    public var snp_leftMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeftMargin) }
    public var snp_rightMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.RightMargin) }
    public var snp_topMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TopMargin) }
    public var snp_bottomMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.BottomMargin) }
    public var snp_leadingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeadingMargin) }
    public var snp_trailingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TrailingMargin) }
    public var snp_centerXWithinMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterXWithinMargins) }
    public var snp_centerYWithinMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    // aggregates
    
    public var snp_edges: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Edges) }
    public var snp_size: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Size) }
    public var snp_center: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Center) }
    
    #if os(iOS)
    public var snp_margins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Margins) }
    public var snp_centerWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterWithinMargins) }
    #endif
    
    public func snp_makeConstraints(block: (make: ConstraintMaker) -> ()) {
        ConstraintMaker.makeConstraints(self, block: block)
    }
    
    public func snp_updateConstraints(block: (make: ConstraintMaker) -> ()) {
        ConstraintMaker.updateConstraints(self, block: block)
    }
    
    public func snp_remakeConstraints(block: (make: ConstraintMaker) -> ()) {
        ConstraintMaker.remakeConstraints(self, block: block)
    }
    
    public func snp_removeConstraints() {
        ConstraintMaker.removeConstraints(self)
    }
    
    // internal
    
    internal var snp_installedLayoutConstraints: Array<LayoutConstraint> {
        get {
            var constraints = objc_getAssociatedObject(self, &installedLayoutConstraintsKey) as? Array<LayoutConstraint>
            if constraints != nil {
                return constraints!
            }
            return []
        }
        set {
            objc_setAssociatedObject(self, &installedLayoutConstraintsKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
}

private var installedLayoutConstraintsKey = ""