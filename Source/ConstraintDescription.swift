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
#else
import AppKit
#endif

// Reduce duplication by centralizing casts
public protocol FloatConvertible {
    var floatValue : Float { get }
}

extension Float : FloatConvertible {
    public var floatValue : Float {
        return self
    }
}

extension Int : FloatConvertible {
    public var floatValue : Float {
        return Float(self)
    }
}

extension UInt : FloatConvertible {
    public var floatValue : Float {
        return Float(self)
    }
}

extension Double : FloatConvertible {
    public var floatValue : Float {
        return Float(self)
    }
}

extension CGFloat : FloatConvertible {
    public var floatValue : Float {
        return Float(self)
    }
}

/**
    Used to expose the final API of a `ConstraintDescription` which allows getting a constraint from it
 */
public protocol ConstraintDescriptionFinalizable: class {
    
    var constraint: Constraint { get }
    
}

/**
    Used to expose priority APIs
 */
public protocol ConstraintDescriptionPriortizable: ConstraintDescriptionFinalizable {
    
    func priority(priority: FloatConvertible) -> ConstraintDescriptionFinalizable
    func priorityRequired() -> ConstraintDescriptionFinalizable
    func priorityHigh() -> ConstraintDescriptionFinalizable
    func priorityMedium() -> ConstraintDescriptionFinalizable
    func priorityLow() -> ConstraintDescriptionFinalizable
}

/**
    Used to expose multiplier & constant APIs
*/
public protocol ConstraintDescriptionEditable: ConstraintDescriptionPriortizable {

    func multipliedBy(amount: FloatConvertible) -> ConstraintDescriptionEditable
    
    func dividedBy(amount: FloatConvertible) -> ConstraintDescriptionEditable

    func offset(amount: FloatConvertible) -> ConstraintDescriptionEditable
    func offset(amount: CGPoint) -> ConstraintDescriptionEditable
    func offset(amount: CGSize) -> ConstraintDescriptionEditable
    func offset(amount: EdgeInsets) -> ConstraintDescriptionEditable
    
    func inset(amount: FloatConvertible) -> ConstraintDescriptionEditable
    func inset(amount: EdgeInsets) -> ConstraintDescriptionEditable
}

/**
    Used to expose relation APIs
*/
public protocol ConstraintDescriptionRelatable: class {
    
    func equalTo(other: ConstraintItem) -> ConstraintDescriptionEditable
    func equalTo(other: View) -> ConstraintDescriptionEditable
    @available(iOS 7.0, *)
    func equalTo(other: LayoutSupport) -> ConstraintDescriptionEditable
    @available(iOS 9.0, OSX 10.11, *)
    func equalTo(other: NSLayoutAnchor) -> ConstraintDescriptionEditable
    func equalTo(other: FloatConvertible) -> ConstraintDescriptionEditable
    func equalTo(other: CGSize) -> ConstraintDescriptionEditable
    func equalTo(other: CGPoint) -> ConstraintDescriptionEditable
    func equalTo(other: EdgeInsets) -> ConstraintDescriptionEditable
    
    func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionEditable
    func lessThanOrEqualTo(other: View) -> ConstraintDescriptionEditable
    @available(iOS 7.0, *)
    func lessThanOrEqualTo(other: LayoutSupport) -> ConstraintDescriptionEditable
    @available(iOS 9.0, OSX 10.11, *)
    func lessThanOrEqualTo(other: NSLayoutAnchor) -> ConstraintDescriptionEditable
    func lessThanOrEqualTo(other: FloatConvertible) -> ConstraintDescriptionEditable
    func lessThanOrEqualTo(other: CGSize) -> ConstraintDescriptionEditable
    func lessThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionEditable
    func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionEditable
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionEditable
    func greaterThanOrEqualTo(other: View) -> ConstraintDescriptionEditable
    @available(iOS 7.0, *)
    func greaterThanOrEqualTo(other: LayoutSupport) -> ConstraintDescriptionEditable
    @available(iOS 9.0, OSX 10.11, *)
    func greaterThanOrEqualTo(other: NSLayoutAnchor) -> ConstraintDescriptionEditable
    func greaterThanOrEqualTo(other: FloatConvertible) -> ConstraintDescriptionEditable
    func greaterThanOrEqualTo(other: CGSize) -> ConstraintDescriptionEditable
    func greaterThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionEditable
    func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionEditable

}

/**
    Used to expose chaining APIs
*/
public protocol ConstraintDescriptionExtendable: ConstraintDescriptionRelatable {
    
    var left: ConstraintDescriptionExtendable { get }
    var top: ConstraintDescriptionExtendable { get }
    var bottom: ConstraintDescriptionExtendable { get }
    var right: ConstraintDescriptionExtendable { get }
    var leading: ConstraintDescriptionExtendable { get }
    var trailing: ConstraintDescriptionExtendable { get }
    var width: ConstraintDescriptionExtendable { get }
    var height: ConstraintDescriptionExtendable { get }
    var centerX: ConstraintDescriptionExtendable { get }
    var centerY: ConstraintDescriptionExtendable { get }
    var baseline: ConstraintDescriptionExtendable { get }
    
    @available(iOS 8.0, *)
    var firstBaseline: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var leftMargin: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var rightMargin: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var topMargin: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var bottomMargin: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var leadingMargin: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var trailingMargin: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var centerXWithinMargins: ConstraintDescriptionExtendable { get }
    @available(iOS 8.0, *)
    var centerYWithinMargins: ConstraintDescriptionExtendable { get }
}

/**
    Used to internally manage building constraint
 */
internal class ConstraintDescription: ConstraintDescriptionExtendable, ConstraintDescriptionEditable, ConstraintDescriptionFinalizable {
    
    internal var left: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Left) }
    internal var top: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Top) }
    internal var right: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Right) }
    internal var bottom: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Bottom) }
    internal var leading: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Leading) }
    internal var trailing: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Trailing) }
    internal var width: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Width) }
    internal var height: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Height) }
    internal var centerX: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.CenterX) }
    internal var centerY: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.CenterY) }
    internal var baseline: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.Baseline) }
    
    @available(iOS 8.0, *)
    internal var firstBaseline: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    @available(iOS 8.0, *)
    internal var leftMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    @available(iOS 8.0, *)
    internal var rightMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.RightMargin) }
    @available(iOS 8.0, *)
    internal var topMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.TopMargin) }
    @available(iOS 8.0, *)
    internal var bottomMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    @available(iOS 8.0, *)
    internal var leadingMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    @available(iOS 8.0, *)
    internal var trailingMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    @available(iOS 8.0, *)
    internal var centerXWithinMargins: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    @available(iOS 8.0, *)
    internal var centerYWithinMargins: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    internal func equalTo(other: ConstraintItem) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: View) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    @available(iOS 7.0, *)
    internal func equalTo(other: LayoutSupport) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    @available(iOS 9.0, OSX 10.11, *)
    internal func equalTo(other: NSLayoutAnchor) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: FloatConvertible) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: CGSize) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: CGPoint) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: EdgeInsets) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    internal func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: View) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    @available(iOS 7.0, *)
    internal func lessThanOrEqualTo(other: LayoutSupport) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    @available(iOS 9.0, OSX 10.11, *)
    internal func lessThanOrEqualTo(other: NSLayoutAnchor) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: FloatConvertible) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: CGSize) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    internal func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: View) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    @available(iOS 7.0, *)
    internal func greaterThanOrEqualTo(other: LayoutSupport) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    @available(iOS 9.0, OSX 10.11, *)
    internal func greaterThanOrEqualTo(other: NSLayoutAnchor) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: FloatConvertible) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: CGSize) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionEditable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    internal func multipliedBy(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        self.multiplier = amount.floatValue
        return self
    }
    
    internal func dividedBy(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        self.multiplier = 1.0 / amount.floatValue;
        return self
    }
    
    // MARK: offset
    
    internal func offset(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        self.constant = amount.floatValue
        return self
    }
    internal func offset(amount: CGPoint) -> ConstraintDescriptionEditable {
        self.constant = amount
        return self
    }
    internal func offset(amount: CGSize) -> ConstraintDescriptionEditable {
        self.constant = amount
        return self
    }
    internal func offset(amount: EdgeInsets) -> ConstraintDescriptionEditable {
        self.constant = amount
        return self
    }
    
    // MARK: inset
    
    internal func inset(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        let value = CGFloat(amount.floatValue)
        self.constant = EdgeInsets(top: value, left: value, bottom: -value, right: -value)
        return self
    }
    internal func inset(amount: EdgeInsets) -> ConstraintDescriptionEditable {
        self.constant = EdgeInsets(top: amount.top, left: amount.left, bottom: -amount.bottom, right: -amount.right)
        return self
    }
    
    // MARK: priority
    
    internal func priority(priority: FloatConvertible) -> ConstraintDescriptionFinalizable {
        self.priority = priority.floatValue
        return self
    }
    internal func priorityRequired() -> ConstraintDescriptionFinalizable {
        return self.priority(1000.0)
    }
    internal func priorityHigh() -> ConstraintDescriptionFinalizable {
        return self.priority(750.0)
    }
    internal func priorityMedium() -> ConstraintDescriptionFinalizable {
        #if os(iOS) || os(tvOS)
        return self.priority(500.0)
        #else
        return self.priority(501.0)
        #endif
    }
    internal func priorityLow() -> ConstraintDescriptionFinalizable {
        return self.priority(250.0)
    }
    
    // MARK: Constraint
    
    internal var constraint: Constraint {
        if self.concreteConstraint == nil {
            if self.relation == nil {
                fatalError("Attempting to create a constraint from a ConstraintDescription before it has been fully chained.")
            }
            self.concreteConstraint = ConcreteConstraint(
                fromItem: self.fromItem,
                toItem: self.toItem,
                relation: self.relation!,
                constant: self.constant,
                multiplier: self.multiplier,
                priority: self.priority)
        }
        return self.concreteConstraint!
    }
    
    // MARK: Private
    
    private let fromItem: ConstraintItem
    private var toItem: ConstraintItem {
        willSet {
            if self.concreteConstraint != nil {
                fatalError("Attempting to modify a ConstraintDescription after its constraint has been created.")
            }
        }
    }
    private var relation: ConstraintRelation? {
        willSet {
            if self.concreteConstraint != nil {
                fatalError("Attempting to modify a ConstraintDescription after its constraint has been created.")
            }
        }
    }
    private var constant: Any = Float(0.0) {
        willSet {
            if self.concreteConstraint != nil {
                fatalError("Attempting to modify a ConstraintDescription after its constraint has been created.")
            }
        }
    }
    private var multiplier: Float = 1.0 {
        willSet {
            if self.concreteConstraint != nil {
                fatalError("Attempting to modify a ConstraintDescription after its constraint has been created.")
            }
        }
    }
    private var priority: Float = 1000.0 {
        willSet {
            if self.concreteConstraint != nil {
                fatalError("Attempting to modify a ConstraintDescription after its constraint has been created.")
            }
        }
    }
    private var concreteConstraint: ConcreteConstraint? = nil
    
    private func addConstraint(attributes: ConstraintAttributes) -> ConstraintDescription {
        if self.relation == nil {
            self.fromItem.attributes += attributes
        }
        return self
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation) -> ConstraintDescription {
        if other.attributes != ConstraintAttributes.None {
            let toLayoutAttributes = other.attributes.layoutAttributes
            if toLayoutAttributes.count > 1 {
                let fromLayoutAttributes = self.fromItem.attributes.layoutAttributes
                if toLayoutAttributes != fromLayoutAttributes {
                    NSException(name: "Invalid Constraint", reason: "Cannot constrain to multiple non identical attributes", userInfo: nil).raise()
                    return self
                }
                other.attributes = ConstraintAttributes.None
            }
        }
        self.toItem = other
        self.relation = relation
        return self
    }
    
    private func constrainTo(other: View, relation: ConstraintRelation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    @available(iOS 7.0, *)
    private func constrainTo(other: LayoutSupport, relation: ConstraintRelation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    @available(iOS 9.0, OSX 10.11, *)
    private func constrainTo(other: NSLayoutAnchor, relation: ConstraintRelation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private func constrainTo(other: FloatConvertible, relation: ConstraintRelation) -> ConstraintDescription {
        self.constant = other.floatValue
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private func constrainTo(other: CGSize, relation: ConstraintRelation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private func constrainTo(other: CGPoint, relation: ConstraintRelation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
}
