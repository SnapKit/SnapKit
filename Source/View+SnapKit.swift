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

#if os(iOS) || os(tvOS)
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
    public var left: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Left) }
    
    /// top edge
    public var top: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Top) }
    
    /// right edge
    public var right: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Right) }
    
    /// bottom edge
    public var bottom: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Bottom) }
    
    /// leading edge
    public var leading: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Leading) }
    
    /// trailing edge
    public var trailing: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Trailing) }
    
    /// width dimension
    public var width: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Width) }
    
    /// height dimension
    public var height: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Height) }
    
    /// centerX position
    public var centerX: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterX) }
    
    /// centerY position
    public var centerY: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterY) }
    
    /// baseline position
    public var baseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Baseline) }
    
    /// first baseline position
    @available(iOS 8.0, *)
    public var firstBaseline: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.FirstBaseline) }
    
    /// left margin
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeftMargin) }
    
    /// right margin
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.RightMargin) }
    
    /// top margin
    @available(iOS 8.0, *)
    public var topMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TopMargin) }
    
    /// bottom margin
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.BottomMargin) }
    
    /// leading margin
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.LeadingMargin) }
    
    /// trailing margin
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.TrailingMargin) }
    
    /// centerX within margins
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterXWithinMargins) }
    
    /// centerY within margins
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterYWithinMargins) }
    
    // top + left + bottom + right edges
    public var edges: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Edges) }
    
    // width + height dimensions
    public var size: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Size) }
    
    // centerX + centerY positions
    public var center: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Center) }
    
    // top + left + bottom + right margins
    @available(iOS 8.0, *)
    public var margins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.Margins) }
    
    // centerX + centerY within margins
    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintItem { return ConstraintItem(object: self, attributes: ConstraintAttributes.CenterWithinMargins) }
    
    /**
        Prepares constraints with a `ConstraintMaker` and returns the made constraints but does not install them.

        - parameter closure that will be passed the `ConstraintMaker` to make the constraints with
        
        - returns: the constraints made
    */
    public func prepareConstraints(file: String = #file, line: UInt = #line, @noescape closure: (make: ConstraintMaker) -> Void) -> [Constraint] {
        return ConstraintMaker.prepareConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Makes constraints with a `ConstraintMaker` and installs them along side any previous made constraints.
        
        - parameter closure that will be passed the `ConstraintMaker` to make the constraints with
    */
    public func makeConstraints(file: String = #file, line: UInt = #line, @noescape closure: (make: ConstraintMaker) -> Void) -> Void {
        ConstraintMaker.makeConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Updates constraints with a `ConstraintMaker` that will replace existing constraints that match and install new ones.
    
        For constraints to match only the constant can be updated.
    
        - parameter closure that will be passed the `ConstraintMaker` to update the constraints with
    */
    public func updateConstraints(file: String = #file, line: UInt = #line, @noescape closure: (make: ConstraintMaker) -> Void) -> Void {
        ConstraintMaker.updateConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Remakes constraints with a `ConstraintMaker` that will first remove all previously made constraints and make and install new ones.
    
        - parameter closure that will be passed the `ConstraintMaker` to remake the constraints with
    */
    public func remakeConstraints(file: String = #file, line: UInt = #line, @noescape closure: (make: ConstraintMaker) -> Void) -> Void {
        ConstraintMaker.remakeConstraints(view: self, file: file, line: line, closure: closure)
    }
    
    /**
        Removes all previously made constraints.
    */
    @objc(snp_removeConstraints) public func removeConstraints() {
        ConstraintMaker.removeConstraints(view: self)
    }
    
    internal var installedLayoutConstraints: [LayoutConstraint] {
        get {
            if let constraints = objc_getAssociatedObject(self, &installedLayoutConstraintsKey) as? [LayoutConstraint] {
                return constraints
            }
            return []
        }
        set {
            objc_setAssociatedObject(self, &installedLayoutConstraintsKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

private var installedLayoutConstraintsKey = ""
