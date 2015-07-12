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
public class ConstraintDescriptionFinalizable {
    
    let backing : ConstraintDescription
    
    init(_ backing : ConstraintDescription) {
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
    
    public func priority(priority: Float) -> ConstraintDescriptionFinalizable {
        return ConstraintDescriptionFinalizable(self.backing.priority(priority))
    }
    public func priority(priority: Double) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    public func priority(priority: CGFloat) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    public func priority(priority: UInt) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    public func priority(priority: Int) -> ConstraintDescriptionFinalizable {
        return self.priority(Float(priority))
    }
    public func priorityRequired() -> ConstraintDescriptionFinalizable {
        return self.priority(1000)
    }
    public func priorityHigh() -> ConstraintDescriptionFinalizable {
        return self.priority(750)
    }
    public func priorityMedium() -> ConstraintDescriptionFinalizable {
        #if os(iOS)
            return self.priority(500)
        #else
            return self.priority(501)
        #endif
    }
    public func priorityLow() -> ConstraintDescriptionFinalizable {
        return self.priority(250)
    }
}

/**
    Used to expose multiplier & constant APIs
*/
public class ConstraintDescriptionEditable: ConstraintDescriptionPriortizable {

    public func multipliedBy(amount: Float) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.multipliedBy(amount))
    }
    public func multipliedBy(amount: Double) -> ConstraintDescriptionEditable {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: CGFloat) -> ConstraintDescriptionEditable {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: Int) -> ConstraintDescriptionEditable {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: UInt) -> ConstraintDescriptionEditable {
        return self.multipliedBy(Float(amount))
    }
    
    public func dividedBy(amount: Float) -> ConstraintDescriptionEditable {
        return self.multipliedBy(1 / Float(amount))
    }
    public func dividedBy(amount: Double) -> ConstraintDescriptionEditable {
        return self.multipliedBy(1 / Float(amount))
    }
    public func dividedBy(amount: CGFloat) -> ConstraintDescriptionEditable {
        return self.multipliedBy(1 / Float(amount))
    }
    public func dividedBy(amount: Int) -> ConstraintDescriptionEditable {
        return self.multipliedBy(1 / Float(amount))
    }
    public func dividedBy(amount: UInt) -> ConstraintDescriptionEditable {
        return self.multipliedBy(1 / Float(amount))
    }

    public func offset(amount: Float) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.offset(amount))
    }
    public func offset(amount: Double) -> ConstraintDescriptionEditable {
        return self.offset(Float(amount))
    }
    public func offset(amount: CGFloat) -> ConstraintDescriptionEditable {
        return self.offset(Float(amount))
    }
    public func offset(amount: Int) -> ConstraintDescriptionEditable {
        return self.offset(Float(amount))
    }
    public func offset(amount: UInt) -> ConstraintDescriptionEditable {
        return self.offset(Float(amount))
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
    
    public func insets(amount: EdgeInsets) -> ConstraintDescriptionEditable {
        return ConstraintDescriptionEditable(self.backing.insets(amount))
    }
}

/**
    Used to expose relation APIs
*/
public class ConstraintDescriptionRelatable  {
    
    private let backing : ConstraintDescription
    
    init(_ backing : ConstraintDescription) {
        self.backing = backing
    }
    
    public func equalTo(other: ConstraintItem, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    public func equalTo(other: View, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    #if os(iOS)
    public func equalTo(other: UILayoutSupport, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    #endif
    public func equalTo(other: Float, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    public func equalTo(other: Double, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .Equal, location : location))
    }
    public func equalTo(other: CGFloat, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .Equal, location : location))
    }
    public func equalTo(other: Int, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .Equal, location : location))
    }
    public func equalTo(other: UInt, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .Equal, location : location))
    }
    public func equalTo(other: CGSize, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    public func equalTo(other: CGPoint, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    public func equalTo(other: EdgeInsets, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .Equal, location : location))
    }
    
    public func lessThanOrEqualTo(other: ConstraintItem, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    func lessThanOrEqualTo(other: View, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    #if os(iOS)
    public func lessThanOrEqualTo(other: UILayoutSupport, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    #endif
    public func lessThanOrEqualTo(other: Float, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: Double, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: CGFloat, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: Int, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: UInt, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: CGSize, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: CGPoint, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    public func lessThanOrEqualTo(other: EdgeInsets, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .LessThanOrEqualTo, location : location))
    }
    
    public func greaterThanOrEqualTo(other: ConstraintItem, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: View, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }
    #if os(iOS)
    public func greaterThanOrEqualTo(other: UILayoutSupport, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }
    #endif
    public func greaterThanOrEqualTo(other: Float, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: Double, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: CGFloat, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: Int, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: UInt, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(Float(other), relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: CGSize, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: CGPoint, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }
    public func greaterThanOrEqualTo(other: EdgeInsets, file : String = __FILE__, line : UInt = __LINE__) -> ConstraintDescriptionEditable {
        let location = SourceLocation(file : file, line : line)
        return ConstraintDescriptionEditable(self.backing.constrainTo(other, relation : .GreaterThanOrEqualTo, location : location))
    }

}

/**
    Used to expose chaining APIs
*/
public class ConstraintDescriptionExtendable: ConstraintDescriptionRelatable {
    
    internal override init(_ backing : ConstraintDescription) {
        super.init(backing)
    }
    
    public var left: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.left)
    }
    public var top: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.top)
    }
    public var bottom: ConstraintDescriptionExtendable{
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
    
    #if os(iOS)
    public var firstBaseline: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.firstBaseline)
    }

    public var leftMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.leftMargin)
    }

    public var rightMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.rightMargin)
    }

    public var topMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.topMargin)
    }

    public var bottomMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.bottomMargin)
    }

    public var leadingMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.leadingMargin)
    }

    public var trailingMargin: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.trailingMargin)
    }

    public var centerXWithinMargins: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.centerXWithinMargins)
    }

    public var centerYWithinMargins: ConstraintDescriptionExtendable {
        return ConstraintDescriptionExtendable(self.backing.centerYWithinMargins)
    }

    #endif
}

/**
    Used to internally manage building constraint
 */
internal class ConstraintDescription {
    
    internal var left: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Left) }
    internal var top: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Top) }
    internal var right: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Right) }
    internal var bottom: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Bottom) }
    internal var leading: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Leading) }
    internal var trailing: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Trailing) }
    internal var width: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Width) }
    internal var height: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Height) }
    internal var centerX: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterX) }
    internal var centerY: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterY) }
    internal var baseline: ConstraintDescription { return self.addConstraint(ConstraintAttributes.Baseline) }
    
    #if os(iOS)
    internal var firstBaseline: ConstraintDescription { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    internal var leftMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    internal var rightMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.RightMargin) }
    internal var topMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.TopMargin) }
    internal var bottomMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    internal var leadingMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    internal var trailingMargin: ConstraintDescription { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    internal var centerXWithinMargins: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    internal var centerYWithinMargins: ConstraintDescription { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    internal var location : SourceLocation? = nil
    
    // MARK: multiplier
    
    internal func multipliedBy(amount: Float) -> ConstraintDescription {
        self.multiplier = amount
        return self
    }
    // MARK: offset
    
    internal func offset(amount: Float) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    internal func offset(amount: CGPoint) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    internal func offset(amount: CGSize) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    internal func offset(amount: EdgeInsets) -> ConstraintDescription {
        self.constant = amount
        return self
    }
    
    // MARK: insets
    
    internal func insets(amount: EdgeInsets) -> ConstraintDescription {
        self.constant = EdgeInsets(top: amount.top, left: amount.left, bottom: -amount.bottom, right: -amount.right)
        return self
    }
    
    // MARK: priority
    
    internal func priority(priority: Float) -> ConstraintDescription {
        self.priority = priority
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
                priority: self.priority,
                location : self.location
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
    
    private func updateLocationIfNecessary(location : SourceLocation) {
        self.location = self.location ?? location
        self.concreteConstraint?.location = location
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        self.updateLocationIfNecessary(location)
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
    
    private func constrainTo(other: View, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation, location : location)
    }
    
    #if os(iOS)
    
    private func constrainTo(other: UILayoutSupport, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation, location : location)
    }
    
    #endif
    
    private func constrainTo(other: Float, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation, location : location)
    }
    
    private func constrainTo(other: CGSize, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation, location : location)
    }
    
    private func constrainTo(other: CGPoint, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation, location : location)
    }
    
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation, location : SourceLocation) -> ConstraintDescription {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation, location : location)
    }
}