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
#else
import AppKit
#endif

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
    
    func priority(priority: Float) -> ConstraintDescriptionFinalizable
    func priority(priority: Double) -> ConstraintDescriptionFinalizable
    func priority(priority: CGFloat) -> ConstraintDescriptionFinalizable
    func priority(priority: UInt) -> ConstraintDescriptionFinalizable
    func priority(priority: Int) -> ConstraintDescriptionFinalizable
    func priorityRequired() -> ConstraintDescriptionFinalizable
    func priorityHigh() -> ConstraintDescriptionFinalizable
    func priorityMedium() -> ConstraintDescriptionFinalizable
    func priorityLow() -> ConstraintDescriptionFinalizable
}

/**
    Used to expose multiplier APIs
*/
public protocol ConstraintDescriptionMultipliable: ConstraintDescriptionPriortizable {
    
    func multipliedBy(amount: Float) -> ConstraintDescriptionPriortizable
    func multipliedBy(amount: Double) -> ConstraintDescriptionPriortizable
    func multipliedBy(amount: CGFloat) -> ConstraintDescriptionPriortizable
    func multipliedBy(amount: Int) -> ConstraintDescriptionPriortizable
    func multipliedBy(amount: UInt) -> ConstraintDescriptionPriortizable
    
    func dividedBy(amount: Float) -> ConstraintDescriptionPriortizable
    func dividedBy(amount: Double) -> ConstraintDescriptionPriortizable
    func dividedBy(amount: CGFloat) -> ConstraintDescriptionPriortizable
    func dividedBy(amount: Int) -> ConstraintDescriptionPriortizable
    func dividedBy(amount: UInt) -> ConstraintDescriptionPriortizable
}

/**
    Used to expose constant APIs
*/
public protocol ConstraintDescriptionOffsetable: ConstraintDescriptionMultipliable {
    
    func offset(amount: Float) -> ConstraintDescriptionMultipliable
    func offset(amount: Double) -> ConstraintDescriptionMultipliable
    func offset(amount: CGFloat) -> ConstraintDescriptionMultipliable
    func offset(amount: Int) -> ConstraintDescriptionMultipliable
    func offset(amount: UInt) -> ConstraintDescriptionMultipliable
    func offset(amount: CGPoint) -> ConstraintDescriptionMultipliable
    func offset(amount: CGSize) -> ConstraintDescriptionMultipliable
    func offset(amount: EdgeInsets) -> ConstraintDescriptionMultipliable
    
    func insets(amount: EdgeInsets) -> ConstraintDescriptionMultipliable
}

/**
    Used to expose relation APIs
*/
public protocol ConstraintDescriptionRelatable: class {
    
    func equalTo(other: ConstraintItem) -> ConstraintDescriptionOffsetable
    func equalTo(other: View) -> ConstraintDescriptionOffsetable
    #if os(iOS)
    func equalTo(other: UILayoutSupport) -> ConstraintDescriptionOffsetable
    #endif
    func equalTo(other: Float) -> ConstraintDescriptionMultipliable
    func equalTo(other: Double) -> ConstraintDescriptionMultipliable
    func equalTo(other: CGFloat) -> ConstraintDescriptionMultipliable
    func equalTo(other: Int) -> ConstraintDescriptionMultipliable
    func equalTo(other: UInt) -> ConstraintDescriptionMultipliable
    func equalTo(other: CGSize) -> ConstraintDescriptionMultipliable
    func equalTo(other: CGPoint) -> ConstraintDescriptionMultipliable
    func equalTo(other: EdgeInsets) -> ConstraintDescriptionMultipliable
    
    func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionOffsetable
    func lessThanOrEqualTo(other: View) -> ConstraintDescriptionOffsetable
    #if os(iOS)
    func lessThanOrEqualTo(other: UILayoutSupport) -> ConstraintDescriptionOffsetable
    #endif
    func lessThanOrEqualTo(other: Float) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: Double) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: CGFloat) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: Int) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: UInt) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: CGSize) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionMultipliable
    func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionMultipliable
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionOffsetable
    func greaterThanOrEqualTo(other: View) -> ConstraintDescriptionOffsetable
    #if os(iOS)
    func greaterThanOrEqualTo(other: UILayoutSupport) -> ConstraintDescriptionOffsetable
    #endif
    func greaterThanOrEqualTo(other: Float) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: Double) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: CGFloat) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: Int) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: UInt) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: CGSize) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionMultipliable
    func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionMultipliable

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
    
    #if os(iOS)
    var firstBaseline: ConstraintDescriptionExtendable { get }
    var leftMargin: ConstraintDescriptionExtendable { get }
    var rightMargin: ConstraintDescriptionExtendable { get }
    var topMargin: ConstraintDescriptionExtendable { get }
    var bottomMargin: ConstraintDescriptionExtendable { get }
    var leadingMargin: ConstraintDescriptionExtendable { get }
    var trailingMargin: ConstraintDescriptionExtendable { get }
    var centerXWithinMargins: ConstraintDescriptionExtendable { get }
    var centerYWithinMargins: ConstraintDescriptionExtendable { get }
    #endif
}

/**
    Used to internally manage building constraint
 */
final internal class ConstraintDescription: ConstraintDescriptionExtendable, ConstraintDescriptionOffsetable, ConstraintDescriptionFinalizable {
    
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
    
    #if os(iOS)
    internal var firstBaseline: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    internal var leftMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    internal var rightMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.RightMargin) }
    internal var topMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.TopMargin) }
    internal var bottomMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    internal var leadingMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    internal var trailingMargin: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    internal var centerXWithinMargins: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    internal var centerYWithinMargins: ConstraintDescriptionExtendable { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    internal func equalTo(other: ConstraintItem) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: View) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    
    #if os(iOS)
    internal func equalTo(other: UILayoutSupport) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .Equal)
    }
    #endif
    internal func equalTo(other: Float) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: Double) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    internal func equalTo(other: CGFloat) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    internal func equalTo(other: Int) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    internal func equalTo(other: UInt) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    internal func equalTo(other: CGSize) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: CGPoint) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    internal func equalTo(other: EdgeInsets) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    internal func lessThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: View) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #if os(iOS)
    internal func lessThanOrEqualTo(other: UILayoutSupport) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #endif
    internal func lessThanOrEqualTo(other: Float) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: Double) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: CGFloat) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: Int) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: UInt) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: CGSize) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    internal func lessThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    internal func greaterThanOrEqualTo(other: ConstraintItem) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: View) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #if os(iOS)
    internal func greaterThanOrEqualTo(other: UILayoutSupport) -> ConstraintDescriptionOffsetable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #endif
    internal func greaterThanOrEqualTo(other: Float) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: Double) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: CGFloat) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: Int) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: UInt) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: CGSize) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: CGPoint) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    internal func greaterThanOrEqualTo(other: EdgeInsets) -> ConstraintDescriptionMultipliable {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    internal func multipliedBy(amount: Float) -> ConstraintDescriptionPriortizable {
        self.multiplier = amount
        return self
    }
    internal func multipliedBy(amount: Double) -> ConstraintDescriptionPriortizable {
        return self.multipliedBy(Float(amount))
    }
    internal func multipliedBy(amount: CGFloat) -> ConstraintDescriptionPriortizable {
        return self.multipliedBy(Float(amount))
    }
    internal func multipliedBy(amount: Int) -> ConstraintDescriptionPriortizable {
        return self.multipliedBy(Float(amount))
    }
    internal func multipliedBy(amount: UInt) -> ConstraintDescriptionPriortizable {
        return self.multipliedBy(Float(amount))
    }
    
    internal func dividedBy(amount: Float) -> ConstraintDescriptionPriortizable {
        self.multiplier = 1.0 / amount;
        return self
    }
    internal func dividedBy(amount: Double) -> ConstraintDescriptionPriortizable {
        return self.dividedBy(Float(amount))
    }
    internal func dividedBy(amount: CGFloat) -> ConstraintDescriptionPriortizable {
        return self.dividedBy(Float(amount))
    }
    internal func dividedBy(amount: Int) -> ConstraintDescriptionPriortizable {
        return self.dividedBy(Float(amount))
    }
    internal func dividedBy(amount: UInt) -> ConstraintDescriptionPriortizable {
        return self.dividedBy(Float(amount))
    }
    
    // MARK: priority
    
    internal func priority(priority: Float) -> ConstraintDescriptionFinalizable {
        self.priority = priority
        return self
    }
    internal func priority(priority: Double) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    internal func priority(priority: CGFloat) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    func priority(priority: UInt) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    internal func priority(priority: Int) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    internal func priorityRequired() -> ConstraintDescriptionFinalizable {
        return self.priority(1000.0)
    }
    internal func priorityHigh() -> ConstraintDescriptionFinalizable {
        return self.priority(750.0)
    }
    internal func priorityMedium() -> ConstraintDescriptionFinalizable {
        #if os(iOS)
        return self.priority(500.0)
        #else
        return self.priority(501.0)
        #endif
    }
    internal func priorityLow() -> ConstraintDescriptionFinalizable {
        return self.priority(250.0)
    }
    
    // MARK: offset
    
    internal func offset(amount: Float) -> ConstraintDescriptionMultipliable {
        self.constant = amount
        return self
    }
    internal func offset(amount: Double) -> ConstraintDescriptionMultipliable {
        return self.offset(Float(amount))
    }
    internal func offset(amount: CGFloat) -> ConstraintDescriptionMultipliable {
        return self.offset(Float(amount))
    }
    internal func offset(amount: Int) -> ConstraintDescriptionMultipliable {
        return self.offset(Float(amount))
    }
    internal func offset(amount: UInt) -> ConstraintDescriptionMultipliable {
        return self.offset(Float(amount))
    }
    internal func offset(amount: CGPoint) -> ConstraintDescriptionMultipliable {
        self.constant = amount
        return self
    }
    internal func offset(amount: CGSize) -> ConstraintDescriptionMultipliable {
        self.constant = amount
        return self
    }
    internal func offset(amount: EdgeInsets) -> ConstraintDescriptionMultipliable {
        self.constant = amount
        return self
    }
    
    // MARK: insets
    
    internal func insets(amount: EdgeInsets) -> ConstraintDescriptionMultipliable {
        self.constant = EdgeInsets(top: amount.top, left: amount.left, bottom: -amount.bottom, right: -amount.right)
        return self
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
    
    #if os(iOS)
    
    private func constrainTo(other: UILayoutSupport, relation: ConstraintRelation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    #endif
    
    private func constrainTo(other: Float, relation: ConstraintRelation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private func constrainTo(other: Double, relation: ConstraintRelation) -> ConstraintDescription {
        self.constant = other
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