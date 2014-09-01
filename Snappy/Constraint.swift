//
//  Constraint.swift
//  Snappy
//
//  Copyright (c) 2011-2014 Masonry Team - https://github.com/Masonry
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
 * ConstraintAttributes is an options set that maps to NSLayoutAttributes.
 */
struct ConstraintAttributes: RawOptionSetType, BooleanType {

    var value: UInt
    var boolValue: Bool {
        return self.value != 0
    }

    init(_ value: UInt) {
        self.value = value
    }
    func toRaw() -> UInt { return self.value }
    func getLogicValue() -> Bool { return self.value != 0 }
    static var allZeros: ConstraintAttributes { return self(0) }
    static func fromRaw(raw: UInt) -> ConstraintAttributes? { return self(raw) }
    static func fromMask(raw: UInt) -> ConstraintAttributes { return self(raw) }
    static func convertFromNilLiteral() -> ConstraintAttributes { return self(0) }
    
    static var None: ConstraintAttributes { return self(0) }
    static var Left: ConstraintAttributes { return self(1) }
    static var Top: ConstraintAttributes {  return self(2) }
    static var Right: ConstraintAttributes { return self(4) }
    static var Bottom: ConstraintAttributes { return self(8) }
    static var Leading: ConstraintAttributes { return self(16) }
    static var Trailing: ConstraintAttributes { return self(32) }
    static var Width: ConstraintAttributes { return self(64) }
    static var Height: ConstraintAttributes { return self(128) }
    static var CenterX: ConstraintAttributes { return self(256) }
    static var CenterY: ConstraintAttributes { return self(512) }
    static var Baseline: ConstraintAttributes { return self(1024) }
    
    static var Edges: ConstraintAttributes { return self(15) }
    static var Size: ConstraintAttributes { return self(192) }
    static var Center: ConstraintAttributes { return self(768) }
    
    var layoutAttributes:Array<NSLayoutAttribute> {
        var attrs: Array<NSLayoutAttribute> = []
        if (self & ConstraintAttributes.Left) {
            attrs.append(.Left)
        }
        if (self & ConstraintAttributes.Top) {
            attrs.append(.Top)
        }
        if (self & ConstraintAttributes.Right) {
            attrs.append(.Right)
        }
        if (self & ConstraintAttributes.Bottom) {
            attrs.append(.Bottom)
        }
        if (self & ConstraintAttributes.Leading) {
            attrs.append(.Leading)
        }
        if (self & ConstraintAttributes.Trailing) {
            attrs.append(.Trailing)
        }
        if (self & ConstraintAttributes.Width) {
            attrs.append(.Width)
        }
        if (self & ConstraintAttributes.Height) {
            attrs.append(.Height)
        }
        if (self & ConstraintAttributes.CenterX) {
            attrs.append(.CenterX)
        }
        if (self & ConstraintAttributes.CenterY) {
            attrs.append(.CenterY)
        }
        if (self & ConstraintAttributes.Baseline) {
            attrs.append(.Baseline)
        }
        return attrs
    }
}
func += (inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left = (left | right)
}
func -= (inout left: ConstraintAttributes, right: ConstraintAttributes) {
    left = left & ~right
}

/**
 * ConstraintRelation is an Int enum that maps to NSLayoutRelation.
 */
enum ConstraintRelation: Int {
    case Equal = 1, LessThanOrEqualTo, GreaterThanOrEqualTo
    
    var layoutRelation: NSLayoutRelation {
        get {
            switch(self) {
            case .LessThanOrEqualTo:
                return .LessThanOrEqual
            case .GreaterThanOrEqualTo:
                return .GreaterThanOrEqual
            default:
                return .Equal
            }
        }
    }
}

/**
 * ConstraintItem is a class that is used while building constraints.
 */
class ConstraintItem {
    
    init(view: View?, attributes: ConstraintAttributes) {
        self.view = view
        self.attributes = attributes
    }
    
    internal weak var view: View?
    internal var attributes: ConstraintAttributes
}

/**
 * Constraint is a single item that defines all the properties for a single ConstraintMaker chain
 */
class Constraint {
    var left: Constraint { return addConstraint(ConstraintAttributes.Left) }
    var top: Constraint { return addConstraint(ConstraintAttributes.Top) }
    var right: Constraint { return addConstraint(ConstraintAttributes.Right) }
    var bottom: Constraint { return addConstraint(ConstraintAttributes.Bottom) }
    var leading: Constraint { return addConstraint(ConstraintAttributes.Leading) }
    var trailing: Constraint { return addConstraint(ConstraintAttributes.Trailing) }
    var width: Constraint { return addConstraint(ConstraintAttributes.Width) }
    var height: Constraint { return addConstraint(ConstraintAttributes.Height) }
    var centerX: Constraint { return addConstraint(ConstraintAttributes.CenterX) }
    var centerY: Constraint { return addConstraint(ConstraintAttributes.CenterY) }
    var baseline: Constraint { return addConstraint(ConstraintAttributes.Baseline) }
    
    var and: Constraint { return self }
    var with: Constraint { return self }
    
    // MARK: initializer
    
    init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(view: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    func equalTo(other: ConstraintItem) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    func equalTo(other: View) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    func equalTo(other: Float) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    func equalTo(other: Int) -> Constraint {
        return constrainTo(Float(other), relation: .Equal)
    }
    func equalTo(other: CGSize) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    func equalTo(other: CGPoint) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    func equalTo(other: EdgeInsets) -> Constraint {
        return constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    func lessThanOrEqualTo(other: ConstraintItem) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: View) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: Float) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: Int) -> Constraint {
        return constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGSize) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: CGPoint) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    func lessThanOrEqualTo(other: EdgeInsets) -> Constraint {
        return constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    func greaterThanOrEqualTo(other: ConstraintItem) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: View) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: Float) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: Int) -> Constraint {
        return constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGSize) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: CGPoint) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    func greaterThanOrEqualTo(other: EdgeInsets) -> Constraint {
        return constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    func multipliedBy(amount: Float) -> Constraint {
        self.multiplier = amount
        return self
    }
    func dividedBy(amount: Float) -> Constraint {
        self.multiplier = 1.0 / amount;
        return self
    }
    
    // MARK: priority
    
    func priority(priority: Float) -> Constraint {
        self.priority = priority
        return self
    }
    func priorityRequired() -> Constraint {
        return priority(1000.0)
    }
    func priorityHigh() -> Constraint {
        return priority(750.0)
    }
    func priorityLow() -> Constraint {
        return priority(250.0)
    }
    
    // MARK: offset
    
    func offset(amount: Float) -> Constraint {
        self.offset = amount
        return self
    }
    func offset(amount: Int) -> Constraint {
        self.offset = amount
        return self
    }
    func offset(amount: CGPoint) -> Constraint {
        self.offset = amount
        return self
    }
    func offset(amount: CGSize) -> Constraint {
        self.offset = amount
        return self
    }
    func offset(amount: EdgeInsets) -> Constraint {
        self.offset = amount
        return self
    }
    
    // MARK: insets
    
    func insets(amount: EdgeInsets) -> Constraint {
        self.offset = amount
        return self
    }
    
    // MARK: install
    
    func install() -> Array<LayoutConstraint> {
        var installOnView: View? = nil
        if self.toItem.view != nil {
            installOnView = Constraint.closestCommonSuperviewFromView(self.fromItem.view, toView: self.toItem.view)
            if installOnView == nil {
                NSException(name: "Cannot Install Constraint", reason: "No common superview between views", userInfo: nil).raise()
                return []
            }
        } else {
            installOnView = self.fromItem.view?.superview
            if installOnView == nil {
                NSException(name: "Cannot Install Constraint", reason: "Missing superview", userInfo: nil).raise()
                return []
            }
        }
        
        var layoutConstraints: Array<LayoutConstraint> = []
        let layoutFromAttributes = self.fromItem.attributes.layoutAttributes
        let layoutToAttributes = self.toItem.attributes.layoutAttributes
        
        // get layout from
        let layoutFrom: View? = self.fromItem.view
        
        // get layout to
        let layoutTo: View? = self.toItem.view
        
        // get layout relation
        let layoutRelation: NSLayoutRelation = (self.relation != nil) ? self.relation!.layoutRelation : .Equal
        
        for layoutFromAttribute in layoutFromAttributes {
            // get layout to attribute
            let layoutToAttribute = (layoutToAttributes.count > 0) ? layoutToAttributes[0] : layoutFromAttribute
            
            // get layout constant
            var layoutConstant: CGFloat = layoutToAttribute.snp_constantForValue(self.constant)
            layoutConstant += layoutToAttribute.snp_offsetForValue(self.offset)
            
            // create layout constraint
            let layoutConstraint = LayoutConstraint(
                item: layoutFrom,
                attribute: layoutFromAttribute,
                relatedBy: layoutRelation,
                toItem: layoutTo,
                attribute: layoutToAttribute,
                multiplier: CGFloat(self.multiplier),
                constant: layoutConstant)
            
            // set priority
            layoutConstraint.priority = self.priority
            
            // set constraint
            layoutConstraint.constraint = self
            
            layoutConstraints.append(layoutConstraint)
        }
        
        installOnView?.addConstraints(layoutConstraints)
        
        self.installedOnView = installOnView
        return layoutConstraints
    }
    
    // MARK: uninstall
    
    func uninstall() {
        if let view = self.installedOnView {
            #if os(iOS)
            var installedConstraints = view.constraints()
            #else
            var installedConstraints = view.constraints
            #endif
            var constraintsToRemove: Array<LayoutConstraint> = []
            for installedConstraint in installedConstraints {
                if let layoutConstraint = installedConstraint as? LayoutConstraint {
                    if layoutConstraint.constraint === self {
                        constraintsToRemove.append(layoutConstraint)
                    }
                }
            }
            if constraintsToRemove.count > 0 {
                view.removeConstraints(constraintsToRemove)
            }
        }
        self.installedOnView = nil
    }
    
    // MARK: private
    
    private let fromItem: ConstraintItem
    private var toItem: ConstraintItem
    private var relation: ConstraintRelation?
    private var constant: Any?
    private var multiplier: Float = 1.0
    private var priority: Float = 1000.0
    private var offset: Any?
    
    private weak var installedOnView: View?
    
    private func addConstraint(attributes: ConstraintAttributes) -> Constraint {
        if self.relation == nil {
            self.fromItem.attributes += attributes
        }
        return self
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation) -> Constraint {
        if other.attributes != ConstraintAttributes.None {
            var toLayoutAttributes = other.attributes.layoutAttributes
            if toLayoutAttributes.count > 1 {
                var fromLayoutAttributes = self.fromItem.attributes.layoutAttributes
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
    private func constrainTo(other: View, relation: ConstraintRelation) -> Constraint {
        return constrainTo(ConstraintItem(view: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: Float, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(view: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGSize, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(view: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGPoint, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(view: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(view: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private class func closestCommonSuperviewFromView(fromView: View?, toView: View?) -> View? {
        var closestCommonSuperview: View?
        var secondViewSuperview: View? = toView
        while closestCommonSuperview == nil && secondViewSuperview != nil {
            var firstViewSuperview = fromView
            while closestCommonSuperview == nil && firstViewSuperview != nil {
                if secondViewSuperview == firstViewSuperview {
                    closestCommonSuperview = secondViewSuperview
                }
                firstViewSuperview = firstViewSuperview?.superview
            }
            secondViewSuperview = secondViewSuperview?.superview
        }
        return closestCommonSuperview
    }
}

private extension NSLayoutAttribute {
    
    func snp_offsetForValue(value: Any?) -> CGFloat {
        // Float
        if let float = value as? Float {
            return CGFloat(float)
        }
        // Int
        else if let int = value as? Int {
            return CGFloat(int)
        }
        // CGFloat
        else if let float = value as? CGFloat {
            return float
        }
        // CGSize
        else if let size = value as? CGSize {
            if self == .Width {
                return size.width
            } else if self == .Height {
                return size.height
            }
        }
        // CGPoint
        else if let point = value as? CGPoint {
            if self == .Left || self == .CenterX {
                return point.x
            } else if self == .Top || self == .CenterY {
                return point.y
            } else if self == .Right {
                return -point.x
            } else if self == .Bottom {
                return -point.y
            }
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            if self == .Left {
                return insets.left
            } else if self == .Top {
                return insets.top
            } else if self == .Right {
                return -insets.right
            } else if self == .Bottom {
                return -insets.bottom
            }
        }
        
        return CGFloat(0)
    }
    
    func snp_constantForValue(value: Any?) -> CGFloat {
        // Float
        if let float = value as? Float {
            return CGFloat(float)
        }
        // Int
        else if let int = value as? Int {
            return CGFloat(int)
        }
        // CGFloat
        else if let float = value as? CGFloat {
            return float
        }
        // CGSize
        else if let size = value as? CGSize {
            if self == .Width {
                return size.width
            } else if self == .Height {
                return size.height
            }
        }
        // CGPoint
        else if let point = value as? CGPoint {
            if self == .Left || self == .CenterX {
                return point.x
            } else if self == .Top || self == .CenterY {
                return point.y
            } else if self == .Right {
                return point.x
            } else if self == .Bottom {
                return point.y
            }
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            if self == .Left {
                return insets.left
            } else if self == .Top {
                return insets.top
            } else if self == .Right {
                return insets.right
            } else if self == .Bottom {
                return insets.bottom
            }
        }
        
        return CGFloat(0);
    }
}
