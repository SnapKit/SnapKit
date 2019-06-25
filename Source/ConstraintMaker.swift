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

public class ConstraintMaker {
    
    public var left: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.left)
    }
    
    public var top: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.top)
    }
    
    public var bottom: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.bottom)
    }
    
    public var right: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.right)
    }
    
    public var leading: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.leading)
    }
    
    public var trailing: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.trailing)
    }
    
    public var width: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.width)
    }
    
    public var height: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.height)
    }
    
    public var centerX: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.centerX)
    }
    
    public var centerY: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.centerY)
    }
    
    @available(*, deprecated, message:"Use lastBaseline instead")
    public var baseline: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.lastBaseline)
    }
    
    public var lastBaseline: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.lastBaseline)
    }
    
    @available(iOS 8.0, OSX 10.11, *)
    public var firstBaseline: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.firstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.leftMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.rightMargin)
    }
    
    @available(iOS 8.0, *)
    public var topMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.topMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.bottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.leadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.trailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.centerXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.centerYWithinMargins)
    }
    
    public var edges: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.edges)
    }
    public var size: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.size)
    }
    public var center: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.center)
    }
    
    @available(iOS 8.0, *)
    public var margins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.margins)
    }
    
    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(.centerWithinMargins)
    }
    
    private let item: LayoutConstraintItem
    private var descriptions = [ConstraintDescription]()
    
    internal init(item: LayoutConstraintItem) {
        self.item = item
        self.item.prepare()
    }
    
    internal func makeExtendableWithAttributes(_ attributes: ConstraintAttributes) -> ConstraintMakerExtendable {
        let description = ConstraintDescription(item: self.item, attributes: attributes)
        self.descriptions.append(description)
        return ConstraintMakerExtendable(description)
    }
    
    internal static func prepareConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        let maker = ConstraintMaker(item: item)
        closure(maker)
        var constraints: [Constraint] = []
        for description in maker.descriptions {
            guard let constraint = description.constraint else {
                continue
            }
            constraints.append(constraint)
        }
        return constraints
    }
    
    internal static func makeConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) {
        let constraints = prepareConstraints(item: item, closure: closure)
        for constraint in constraints {
            constraint.activateIfNeeded(updatingExisting: false)
        }
    }
    
    internal static func remakeConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) {
        self.removeConstraints(item: item)
        self.makeConstraints(item: item, closure: closure)
    }
    
    internal static func updateConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) {
        guard item.constraints.count > 0 else {
            self.makeConstraints(item: item, closure: closure)
            return
        }
        
        let constraints = prepareConstraints(item: item, closure: closure)
        for constraint in constraints {
            constraint.activateIfNeeded(updatingExisting: true)
        }
    }
    
    internal static func removeConstraints(item: LayoutConstraintItem) {
        let constraints = item.constraints
        for constraint in constraints {
            constraint.deactivateIfNeeded()
        }
    }
    
}
