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

public protocol RelationTarget {
    var constraintItem: ConstraintItem { get }
}

public protocol FloatConvertible: RelationTarget {
    var floatValue: Float { get }
}

extension FloatConvertible {
    public var constraintItem: ConstraintItem {
        return ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
}

extension Float: FloatConvertible, RelationTarget {
    public var floatValue: Float {
        return self
    }
}

extension Int: FloatConvertible, RelationTarget {
    public var floatValue: Float {
        return Float(self)
    }
}

extension UInt: FloatConvertible, RelationTarget {
    public var floatValue: Float {
        return Float(self)
    }
}

extension Double: FloatConvertible, RelationTarget {
    public var floatValue: Float {
        return Float(self)
    }
}

extension CGFloat: FloatConvertible, RelationTarget {
    public var floatValue: Float {
        return Float(self)
    }
}

@available(iOS 9.0, OSX 10.11, *)
extension NSLayoutAnchor: RelationTarget {
    public var constraintItem: ConstraintItem {
        return ConstraintItem(object: self, attributes: ConstraintAttributes.None)
    }
}

extension CGPoint: RelationTarget {
    public var constraintItem: ConstraintItem {
        return ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
}

extension CGSize: RelationTarget {
    public var constraintItem: ConstraintItem {
        return ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
}

extension EdgeInsets: RelationTarget {
    public var constraintItem: ConstraintItem {
        return ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
}

extension View: RelationTarget {
    public var constraintItem: ConstraintItem {
        return ConstraintItem(object: self, attributes: ConstraintAttributes.None)
    }
}

extension ConstraintItem: RelationTarget {
    public var constraintItem: ConstraintItem {
        return self
    }
}

/**
    Used to expose the final API of a `ConstraintDescription` which allows getting a constraint from it
 */
public class ConstraintDescriptionFinalizable {
    
    private let backing: ConstraintDescription
    
    internal init(_ backing: ConstraintDescription) {
        self.backing = backing
    }
    
    public var constraint: Constraint {
        return backing.constraint
    }
}

/**
    Used to expose priority APIs
 */
public class ConstraintDescriptionPriortizable: ConstraintDescriptionFinalizable {
    
    public func priority(priority: FloatConvertible) -> ConstraintDescriptionFinalizable {
        return ConstraintDescriptionFinalizable(self.backing.priority(priority))
    }
    
    public func priorityRequired() -> ConstraintDescriptionFinalizable {
        return ConstraintDescriptionFinalizable(self.backing.priorityRequired())
    }
    public func priorityHigh() -> ConstraintDescriptionFinalizable {
        return ConstraintDescriptionFinalizable(self.backing.priorityHigh())
    }
    public func priorityMedium() -> ConstraintDescriptionFinalizable {
        return ConstraintDescriptionFinalizable(self.backing.priorityMedium())
    }
    public func priorityLow() -> ConstraintDescriptionFinalizable {
        return ConstraintDescriptionFinalizable(self.backing.priorityLow())
    }
}

/**
    Used to expose multiplier & constant APIs
*/
public class ConstraintDescriptionEditable: ConstraintDescriptionPriortizable {

    public func multipliedBy(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.multipliedBy(amount))
    }
    
    public func dividedBy(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        return self.multipliedBy(1 / amount.floatValue)
    }
    
    public func offset(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.offset(amount))
    }
    public func offset(amount: CGPoint) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.offset(amount))
    }
    public func offset(amount: CGSize) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.offset(amount))
    }
    public func offset(amount: EdgeInsets) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.offset(amount))
    }
    
    public func inset(amount: FloatConvertible) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.inset(amount))
    }
    public func inset(amount: EdgeInsets) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.inset(amount))
    }
}

/**
    Used to expose relation APIs
*/
public class ConstraintDescriptionRelatable {

    private let backing: ConstraintDescription
    
    init(_ backing: ConstraintDescription) {
        self.backing = backing
    }
    
    public func equalTo(other: RelationTarget, file: String = __FILE__, line: UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file: file, line: line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation: .Equal, location: location))
    }
    public func equalTo(other: LayoutSupport, file: String = __FILE__, line: UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file: file, line: line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation: .Equal, location: location))
    }
    
    public func lessThanOrEqualTo(other: RelationTarget, file: String = __FILE__, line: UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file: file, line: line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation: .LessThanOrEqualTo, location: location))
    }
    public func lessThanOrEqualTo(other: LayoutSupport, file: String = __FILE__, line: UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file: file, line: line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation: .LessThanOrEqualTo, location: location))
    }
    
    public func greaterThanOrEqualTo(other: RelationTarget, file: String = __FILE__, line: UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file: file, line: line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation: .GreaterThanOrEqualTo, location: location))
    }
    public func greaterThanOrEqualTo(other: LayoutSupport, file: String = __FILE__, line: UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file: file, line: line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation: .GreaterThanOrEqualTo, location: location))
    }
}

/**
    Used to expose chaining APIs
*/
public class ConstraintDescriptionExtendable: ConstraintDescriptionRelatable {
    
    public var left: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.left)
    }
    public var top: ConstraintDescriptionExtendable  {
        return ConstraintDescriptionExtendable(self.backing.top)
    }
    public var bottom: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.bottom)
    }
    public var right: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.right)
    }
    public var leading: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.leading)
    }
    public var trailing: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.trailing)
    }
    public var width: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.width)
    }
    public var height: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.height)
    }
    public var centerX: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.centerX)
    }
    public var centerY: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.centerY)
    }
    public var baseline: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.baseline)
    }
    
    @available(iOS 8.0, *)
    public var firstBaseline: ConstraintDescriptionExtendable  {
        return ConstraintDescriptionExtendable(self.backing.firstBaseline)
    }
    @available(iOS 8.0, *)
    public var leftMargin: ConstraintDescriptionExtendable  {
        return ConstraintDescriptionExtendable(self.backing.leftMargin)
    }
    @available(iOS 8.0, *)
    public var rightMargin: ConstraintDescriptionExtendable  {
        return ConstraintDescriptionExtendable(self.backing.rightMargin)
    }
    @available(iOS 8.0, *)
    public var topMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.topMargin)
    }
    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.bottomMargin)
    }
    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.leadingMargin)
    }
    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.trailingMargin)
    }
    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintDescriptionExtendable  {
        return ConstraintDescriptionExtendable(self.backing.centerXWithinMargins)
    }
    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.centerYWithinMargins)
    }
}

/**
    Used to internally manage building constraint
 */
internal class ConstraintDescription {
    
    private var location: SourceLocation? = nil
    
    private var left: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Left) }
    private var top: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Top) }
    private var right: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Right) }
    private var bottom: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Bottom) }
    private var leading: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Leading) }
    private var trailing: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Trailing) }
    private var width: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Width) }
    private var height: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Height) }
    private var centerX: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterX) }
    private var centerY: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterY) }
    private var baseline: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Baseline) }
    
    @available(iOS 8.0, *)
    private var firstBaseline: ConstraintDescription { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    @available(iOS 8.0, *)
    private var leftMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    @available(iOS 8.0, *)
    private var rightMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.RightMargin) }
    @available(iOS 8.0, *)
    private var topMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.TopMargin) }
    @available(iOS 8.0, *)
    private var bottomMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    @available(iOS 8.0, *)
    private var leadingMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    @available(iOS 8.0, *)
    private var trailingMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    @available(iOS 8.0, *)
    private var centerXWithinMargins: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    @available(iOS 8.0, *)
    private var centerYWithinMargins: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: multiplier
    
    private func multipliedBy(amount: FloatConvertible) -> ConstraintDescription {
        self.multiplier = amount.floatValue
        return self
    }
    
    private func dividedBy(amount: FloatConvertible) -> ConstraintDescription {
        self.multiplier = 1.0 / amount.floatValue;
        return self
    }
    
    // MARK: offset
    
    private func offset(amount: FloatConvertible) -> ConstraintDescription {
        self.constant = amount.floatValue
        return self
    }
    private func offset(amount: CGPoint) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    private func offset(amount: CGSize) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    private func offset(amount: EdgeInsets) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    
    // MARK: inset
    
    private func inset(amount: FloatConvertible) -> ConstraintDescription {
        let value = CGFloat(amount.floatValue)
        self.constant = EdgeInsets(top: value, left: value, bottom: -value, right: -value)
        return self
    }
    private func inset(amount: EdgeInsets) -> ConstraintDescription {
        self.constant = EdgeInsets(top: amount.top, left: amount.left, bottom: -amount.bottom, right: -amount.right)
        return self
    }
    
    // MARK: priority
    
    private func priority(priority: FloatConvertible) -> ConstraintDescription {
        self.priority = priority.floatValue
        return self
    }
    private func priorityRequired() -> ConstraintDescription {
        return self.priority(1000.0)
    }
    private func priorityHigh() -> ConstraintDescription {
        return self.priority(750.0)
    }
    private func priorityMedium() -> ConstraintDescription {
        #if os(iOS) || os(tvOS)
        return self.priority(500.0)
        #else
        return self.priority(501.0)
        #endif
    }
    private func priorityLow() -> ConstraintDescription {
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
                priority: self.priority,
                location: self.location
            )
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
    
    private func constrainTo(other: RelationTarget, relation: ConstraintRelation, location: SourceLocation) -> ConstraintDescription {
        
        self.location = location
        
        if let constant = other as? FloatConvertible {
            self.constant = constant.floatValue
        }
        
        let item = other.constraintItem
        
        if item.attributes != ConstraintAttributes.None {
            let toLayoutAttributes = item.attributes.layoutAttributes
            if toLayoutAttributes.count > 1 {
                let fromLayoutAttributes = self.fromItem.attributes.layoutAttributes
                if toLayoutAttributes != fromLayoutAttributes {
                    NSException(name: "Invalid Constraint", reason: "Cannot constrain to multiple non identical attributes", userInfo: nil).raise()
                    return self
                }
                item.attributes = ConstraintAttributes.None
            }
        }
        self.toItem = item
        self.relation = relation
        return self
    }
    
    @available(iOS 7.0, *)
    private func constrainTo(other: LayoutSupport, relation: ConstraintRelation, location: SourceLocation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation, location: location)
    }
    
}
