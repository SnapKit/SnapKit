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
        return self.makeExtendableWithAttributes(ConstraintAttributes.Left)
    }
    public var top: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Top)
    }
    public var bottom: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Bottom)
    }
    public var right: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Right)
    }
    public var leading: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Leading)
    }
    public var trailing: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Trailing)
    }
    public var width: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Width)
    }
    public var height: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Height)
    }
    
    public var centerX: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.CenterX)
    }
    public var centerY: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.CenterY)
    }
    public var baseline: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Baseline)
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.FirstBaseline)
    }
    
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.LeftMargin)
    }
    
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.RightMargin)
    }
    
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.BottomMargin)
    }
    
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.LeadingMargin)
    }
    
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.TrailingMargin)
    }
    
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.CenterXWithinMargins)
    }
    
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.CenterYWithinMargins)
    }
    
    public var edges: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Edges)
    }
    public var size: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Size)
    }
    
    @available(iOS 8.0, *)
    public var margins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.Margins)
    }
    
    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintMakerExtendable {
        return self.makeExtendableWithAttributes(ConstraintAttributes.CenterWithinMargins)
    }
    
    private let view: ConstraintView
    private var descriptions = [ConstraintDescription]()
    
    internal init(view: ConstraintView) {
        self.view = view
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func makeExtendableWithAttributes(attributes: ConstraintAttributes) -> ConstraintMakerExtendable {
        let description = ConstraintDescription(view: self.view, attributes: attributes)
        self.descriptions.append(description)
        return ConstraintMakerExtendable(description)
    }
    
    internal static func prepareConstraints(view view: ConstraintView, @noescape closure: (make: ConstraintMaker) -> Void) -> [Constraint] {
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        let constraints = maker.descriptions
            .map { $0.constraint }
            .filter { $0 != nil }
            .map { $0! }
        return constraints
    }
    
    internal static func makeConstraints(view view: ConstraintView, @noescape closure: (make: ConstraintMaker) -> Void) {
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        let constraints = maker.descriptions
            .map { $0.constraint }
            .filter { $0 != nil }
            .map { $0! }
        for constraint in constraints {
            constraint.installIfNeeded()
        }
    }
    
    internal static func remakeConstraints(view view: ConstraintView, @noescape closure: (make: ConstraintMaker) -> Void) {
        self.removeConstraints(view: view)
        self.makeConstraints(view: view, closure: closure)
    }
    
    internal static func updateConstraints(view view: ConstraintView, @noescape closure: (make: ConstraintMaker) -> Void) {
        let maker = ConstraintMaker(view: view)
        closure(make: maker)
        let constraints = maker.descriptions
            .map { $0.constraint }
            .filter { $0 != nil }
            .map { $0! }
        for constraint in constraints {
            constraint.installIfNeeded(updateExisting: true)
        }
    }
    
    internal static func removeConstraints(view view: ConstraintView) {
        
    }
    
}
