//
//  SnapKit
//
//  Copyright (c) 2011-Present SnapKit Team - https://github.com/SnapKit
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
#else
    import AppKit
#endif


public struct ConstraintViewDSL {
    
    public var left: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Left)
    }
    
    public var top: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Top)
    }
    
    public var right: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Right)
    }
    
    public var bottom: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Bottom)
    }
    
    public var leading: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Leading)
    }
    
    public var trailing: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Trailing)
    }
    
    public var width: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Width)
    }
    
    public var height: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Height)
    }
    
    public var centerX: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.CenterX)
    }
    
    public var centerY: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.CenterY)
    }
    
    @available(iOS 8.0, *)
    public var lastBaseline: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.LastBaseline)
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.FirstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.LeftMargin)
    }
    
    @available(iOS 8.0, *)
    public var topMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.TopMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.RightMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.BottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.LeadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.TrailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.CenterXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.CenterYWithinMargins)
    }
    
    public var edges: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Edges)
    }
    
    public var size: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Size)
    }
    
    public var center: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Center)
    }
    
    @available(iOS 8.0, *)
    public var margins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.Margins)
    }
    
    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.CenterWithinMargins)
    }
    
    public func prepareConstraints(@noescape closure closure: (make: ConstraintMaker) -> Void) -> [Constraint] {
        return ConstraintMaker.prepareConstraints(view: self.view, closure: closure)
    }
    
    public func makeConstraints(@noescape closure closure: (make: ConstraintMaker) -> Void) {
        ConstraintMaker.makeConstraints(view: self.view, closure: closure)
    }
    
    public func remakeConstraints(@noescape closure closure: (make: ConstraintMaker) -> Void) {
        ConstraintMaker.remakeConstraints(view: self.view, closure: closure)
    }
    
    public func updateConstraints(@noescape closure closure: (make: ConstraintMaker) -> Void) {
        ConstraintMaker.updateConstraints(view: self.view, closure: closure)
    }
    
    public func removeConstraints() {
        ConstraintMaker.removeConstraints(view: self.view)
    }
    
    public var label: String? {
        get {
            return objc_getAssociatedObject(self.view, &labelKey) as? String
        }
        set {
            objc_setAssociatedObject(self.view, &labelKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    internal let view: ConstraintView
    
    internal init(view: ConstraintView) {
        self.view = view
    }
    
    internal var installedLayoutConstraints: [LayoutConstraint] {
        return objc_getAssociatedObject(self.view, &installedLayoutConstraintsKey) as? [LayoutConstraint] ?? []
    }
    
    internal func appendInstalledLayoutConstraints(layoutConstraints: [LayoutConstraint]) {
        var newValue = self.installedLayoutConstraints
        newValue += layoutConstraints
        objc_setAssociatedObject(self.view, &installedLayoutConstraintsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    internal func removeInstalledLayoutConstraints(layoutConstraints: [LayoutConstraint]) {
        let newValue = self.installedLayoutConstraints.filter { !layoutConstraints.contains($0) }
        objc_setAssociatedObject(self.view, &installedLayoutConstraintsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

private var labelKey: UInt8 = 0
private var installedLayoutConstraintsKey: UInt8 = 0
