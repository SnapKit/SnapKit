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

#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif


public protocol ConstraintDSL {
    
    var target: AnyObject? { get }
    var layoutConstraintItem: LayoutConstraintItem? { get }

    func setLabel(_ value: String?)
    func label() -> String?
    
}
extension ConstraintDSL {
    
    public func setLabel(_ value: String?) {
        objc_setAssociatedObject(self.target as Any, &labelKey, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    public func label() -> String? {
        return objc_getAssociatedObject(self.target as Any, &labelKey) as? String
    }
    
}
private var labelKey: UInt8 = 0


public protocol ConstraintBasicAttributesDSL : ConstraintDSL {
}
extension ConstraintBasicAttributesDSL {
    
    // MARK: Basics
    
    public var left: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.left)
    }
    
    public var top: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.top)
    }
    
    public var right: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.right)
    }
    
    public var bottom: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.bottom)
    }
    
    public var leading: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.leading)
    }
    
    public var trailing: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.trailing)
    }
    
    public var width: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.width)
    }
    
    public var height: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.height)
    }
    
    public var centerX: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.centerX)
    }
    
    public var centerY: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.centerY)
    }
    
    public var edges: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.edges)
    }
    
    public var directionalEdges: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.directionalEdges)
    }

    public var horizontalEdges: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.horizontalEdges)
    }

    public var verticalEdges: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.verticalEdges)
    }

    public var directionalHorizontalEdges: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.directionalHorizontalEdges)
    }

    public var directionalVerticalEdges: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.directionalVerticalEdges)
    }

    public var size: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.size)
    }
    
    public var center: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.center)
    }
    
}

public protocol ConstraintAttributesDSL : ConstraintBasicAttributesDSL {
}
extension ConstraintAttributesDSL {
    
    // MARK: Baselines
    @available(*, deprecated, renamed:"lastBaseline")
    public var baseline: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.lastBaseline)
    }
    
    @available(iOS 8.0, OSX 10.11, *)
    public var lastBaseline: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.lastBaseline)
    }
    
    @available(iOS 8.0, OSX 10.11, *)
    public var firstBaseline: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.firstBaseline)
    }
    
    // MARK: Margins
    
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var topMargin: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.topMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.centerYWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var margins: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.margins)
    }
    
    @available(iOS 8.0, *)
    public var directionalMargins: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.directionalMargins)
    }

    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintItem {
        return makeConstraint(for: self, attributes: ConstraintAttributes.centerWithinMargins)
    }
    
}

private func makeConstraint(for dsl: ConstraintDSL, attributes: ConstraintAttributes) -> ConstraintItem {
    if let item = dsl.layoutConstraintItem {
        return ConstraintItem(layoutConstraintItem: item, attributes: attributes)
    } else {
        return ConstraintItem(target: dsl.target, attributes: attributes)
    }
}
