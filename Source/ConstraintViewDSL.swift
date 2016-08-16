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
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.left)
    }
    
    public var top: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.top)
    }
    
    public var right: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.right)
    }
    
    public var bottom: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.bottom)
    }
    
    public var leading: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.leading)
    }
    
    public var trailing: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.trailing)
    }
    
    public var width: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.width)
    }
    
    public var height: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.height)
    }
    
    public var centerX: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.centerX)
    }
    
    public var centerY: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.centerY)
    }
    
    @available(*, deprecated:0.40.0, message:"Use .lastBaseline instead")
    public var baseline: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.lastBaseline)
    }
    
    @available(iOS 8.0, OSX 10.11, *)
    public var lastBaseline: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.lastBaseline)
    }
    
    @available(iOS 8.0, OSX 10.11, *)
    public var firstBaseline: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.firstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var topMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.topMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.centerYWithinMargins)
    }
    
    public var edges: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.edges)
    }
    
    public var size: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.size)
    }
    
    public var center: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.center)
    }
    
    @available(iOS 8.0, *)
    public var margins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.margins)
    }
    
    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintItem {
        return ConstraintItem(target: self.view, attributes: ConstraintAttributes.centerWithinMargins)
    }
    
    @discardableResult
    public func prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        return ConstraintMaker.prepareConstraints(view: self.view, closure: closure)
    }
    
    public func makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        ConstraintMaker.makeConstraints(view: self.view, closure: closure)
    }
    
    public func remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        ConstraintMaker.remakeConstraints(view: self.view, closure: closure)
    }
    
    public func updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
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
    
    public var contentHuggingHorizontalPriority: Float {
        get {
            return self.view.contentHuggingPriority(for: .horizontal)
        }
        set {
            self.view.setContentHuggingPriority(newValue, for: .horizontal)
        }
    }
    
    public var contentHuggingVerticalPriority: Float {
        get {
            return self.view.contentHuggingPriority(for: .vertical)
        }
        set {
            self.view.setContentHuggingPriority(newValue, for: .vertical)
        }
    }
    
    public var contentCompressionResistanceHorizontalPriority: Float {
        get {
            return self.view.contentCompressionResistancePriority(for: .horizontal)
        }
        set {
            self.view.setContentHuggingPriority(newValue, for: .horizontal)
        }
    }
    
    public var contentCompressionResistanceVerticalPriority: Float {
        get {
            return self.view.contentCompressionResistancePriority(for: .vertical)
        }
        set {
            self.view.setContentCompressionResistancePriority(newValue, for: .vertical)
        }
    }
    
    internal let view: ConstraintView
    
    internal init(view: ConstraintView) {
        self.view = view
        
    }
    
    internal var layoutConstraints: [LayoutConstraint] {
        return objc_getAssociatedObject(self.view, &layoutConstraintsKey) as? [LayoutConstraint] ?? []
    }
    
    internal func add(layoutConstraints: [LayoutConstraint]) {
        let merged = self.layoutConstraints + layoutConstraints
        objc_setAssociatedObject(self.view, &layoutConstraintsKey, merged, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    internal func remove(layoutConstraints: [LayoutConstraint]) {
        let merged = self.layoutConstraints.filter { !layoutConstraints.contains($0) }
        objc_setAssociatedObject(self.view, &layoutConstraintsKey, merged, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
}
private var labelKey: UInt8 = 0
private var layoutConstraintsKey: UInt8 = 0
