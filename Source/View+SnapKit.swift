//
//  SnapKit
//
//  Copyright (c) 2011-2015 SnapKit Team - https://github.com/SnapKit
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

/**
    Used to expose public API on views
*/
public extension View {
    
    /// left edge
    public var snp_left: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Left) }
    
    /// top edge
    public var snp_top: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Top) }
    
    /// right edge
    public var snp_right: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Right) }
    
    /// bottom edge
    public var snp_bottom: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Bottom) }
    
    /// leading edge
    public var snp_leading: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Leading) }
    
    /// trailing edge
    public var snp_trailing: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Trailing) }
    
    /// width dimension
    public var snp_width: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Width) }
    
    /// height dimension
    public var snp_height: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Height) }
    
    /// centerX position
    public var snp_centerX: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterX) }
    
    /// centerY position
    public var snp_centerY: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterY) }
    
    /// baseline position
    public var snp_baseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    
    /// first baseline position
    public var snp_firstBaseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.FirstBaseline) }
    
    /// left margin
    public var snp_leftMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeftMargin) }
    
    /// right margin
    public var snp_rightMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.RightMargin) }
    
    /// top margin
    public var snp_topMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TopMargin) }
    
    /// bottom margin
    public var snp_bottomMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.BottomMargin) }
    
    /// leading margin
    public var snp_leadingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeadingMargin) }
    
    /// trailing margin
    public var snp_trailingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TrailingMargin) }
    
    /// centerX within margins
    public var snp_centerXWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterXWithinMargins) }
    
    /// centerY within margins
    public var snp_centerYWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterYWithinMargins) }
    
    #endif
    
    // top + left + bottom + right edges
    public var snp_edges: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Edges) }
    
    // width + height dimensions
    public var snp_size: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Size) }
    
    // centerX + centerY positions
    public var snp_center: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Center) }
    
    #if os(iOS)
    
    // top + left + bottom + right margins
    public var snp_margins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Margins) }
    
    // centerX + centerY within margins
    public var snp_centerWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterWithinMargins) }
    
    #endif
    
    /**
        Prepares constraints with a `ConstraintMaker` and returns the made constraints but does not install them.

        :param: closure that will be passed the `ConstraintMaker` to make the constraints with
        
        :returns: the constraints made
    */
    public func snp_prepareConstraints(file: String = __FILE__, line: UInt = __LINE__, @noescape closure: (make: ConstraintMaker) -> Void) -> [Constraint] {
        return ConstraintMaker.prepareConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Makes constraints with a `ConstraintMaker` and installs them along side any previous made constraints.
        
        :param: closure that will be passed the `ConstraintMaker` to make the constraints with
    */
    public func snp_makeConstraints(file: String = __FILE__, line: UInt = __LINE__, @noescape closure: (make: ConstraintMaker) -> Void) -> Void {
        ConstraintMaker.makeConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Updates constraints with a `ConstraintMaker` that will replace existing constraints that match and install new ones.
    
        For constraints to match only the constant can be updated.
    
        :param: closure that will be passed the `ConstraintMaker` to update the constraints with
    */
    public func snp_updateConstraints(file: String = __FILE__, line: UInt = __LINE__, @noescape closure: (make: ConstraintMaker) -> Void) -> Void {
        ConstraintMaker.updateConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Remakes constraints with a `ConstraintMaker` that will first remove all previously made constraints and make and install new ones.
    
        :param: closure that will be passed the `ConstraintMaker` to remake the constraints with
    */
    public func snp_remakeConstraints(file: String = __FILE__, line: UInt = __LINE__, @noescape closure: (make: ConstraintMaker) -> Void) -> Void {
        ConstraintMaker.remakeConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Removes all previously made constraints.
    */
    public func snp_removeConstraints() {
        ConstraintMaker.removeConstraints(view: self)
    }
    
    internal var snp_installedLayoutConstraints: [LayoutConstraint] {
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
